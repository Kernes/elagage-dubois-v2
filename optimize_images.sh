#!/bin/bash

# Script pour convertir et optimiser toutes les images JPG/HEIC/PNG en WebP et AVIF
# Utilise ImageMagick pour la conversion

set -e

# Couleurs pour les messages
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Vérifier que ImageMagick est installé
if ! command -v magick &> /dev/null; then
    echo -e "${RED}❌ ImageMagick n'est pas installé. Installez-le avec: brew install imagemagick${NC}"
    exit 1
fi

# Fonction pour convertir une image
convert_image() {
    local input_file="$1"
    local output_dir=$(dirname "$input_file")
    local basename=$(basename "$input_file")
    local name_no_ext="${basename%.*}"
    local ext="${basename##*.}"
    
    # Ignorer les fichiers déjà convertis
    if [[ "$ext" == "webp" ]] || [[ "$ext" == "avif" ]]; then
        return
    fi
    
    echo -e "${YELLOW}🔄 Conversion de: $input_file${NC}"
    
    # Convertir HEIC/HEIF en JPG d'abord si nécessaire
    if [[ "$ext" == "heic" ]] || [[ "$ext" == "HEIC" ]] || [[ "$ext" == "heif" ]] || [[ "$ext" == "HEIF" ]]; then
        local jpg_file="$output_dir/${name_no_ext}.jpg"
        if [[ ! -f "$jpg_file" ]]; then
            echo -e "  📸 Conversion HEIC → JPG..."
            magick convert "$input_file" -quality 85 "$jpg_file"
            input_file="$jpg_file"
            name_no_ext=$(basename "$jpg_file" .jpg)
        else
            input_file="$jpg_file"
            name_no_ext=$(basename "$jpg_file" .jpg)
        fi
    fi
    
    # Convertir PNG en JPG si nécessaire (pour optimisation)
    if [[ "$ext" == "png" ]] || [[ "$ext" == "PNG" ]]; then
        local jpg_file="$output_dir/${name_no_ext}.jpg"
        if [[ ! -f "$jpg_file" ]]; then
            echo -e "  📸 Conversion PNG → JPG..."
            magick convert "$input_file" -quality 85 -background white -alpha remove "$jpg_file"
            input_file="$jpg_file"
            name_no_ext=$(basename "$jpg_file" .jpg)
        else
            input_file="$jpg_file"
            name_no_ext=$(basename "$jpg_file" .jpg)
        fi
    fi
    
    # Créer WebP optimisé
    local webp_file="$output_dir/${name_no_ext}.webp"
    if [[ ! -f "$webp_file" ]] || [[ "$input_file" -nt "$webp_file" ]]; then
        echo -e "  🖼️  Création WebP optimisé..."
        # Redimensionner si trop grand (max 2000px de largeur)
        magick convert "$input_file" \
            -resize '2000x2000>' \
            -quality 85 \
            -strip \
            "$webp_file"
        echo -e "  ${GREEN}✅ WebP créé: $webp_file${NC}"
    fi
    
    # Créer AVIF optimisé
    local avif_file="$output_dir/${name_no_ext}.avif"
    if [[ ! -f "$avif_file" ]] || [[ "$input_file" -nt "$avif_file" ]]; then
        echo -e "  🎨 Création AVIF optimisé..."
        # Redimensionner si trop grand (max 2000px de largeur)
        magick convert "$input_file" \
            -resize '2000x2000>' \
            -quality 50 \
            -strip \
            "$avif_file"
        echo -e "  ${GREEN}✅ AVIF créé: $avif_file${NC}"
    fi
    
    # Optimiser le JPG original si trop gros
    if [[ -f "$input_file" ]]; then
        local file_size=$(stat -f%z "$input_file" 2>/dev/null || stat -c%s "$input_file" 2>/dev/null)
        local max_size=$((500 * 1024)) # 500KB
        
        if [[ $file_size -gt $max_size ]]; then
            echo -e "  📉 Optimisation JPG (taille: $(($file_size / 1024))KB)..."
            local temp_file="${input_file}.tmp"
            magick convert "$input_file" \
                -resize '2000x2000>' \
                -quality 85 \
                -strip \
                "$temp_file"
            mv "$temp_file" "$input_file"
            local new_size=$(stat -f%z "$input_file" 2>/dev/null || stat -c%s "$input_file" 2>/dev/null)
            echo -e "  ${GREEN}✅ JPG optimisé: $(($new_size / 1024))KB${NC}"
        fi
    fi
    
    echo ""
}

# Parcourir tous les dossiers d'images
BASE_DIR="public/images"

echo -e "${GREEN}🚀 Début de l'optimisation des images...${NC}"
echo ""

# Homepage
if [[ -d "$BASE_DIR/homepage" ]]; then
    echo -e "${YELLOW}📁 Traitement du dossier homepage...${NC}"
    find "$BASE_DIR/homepage" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.heic" -o -iname "*.HEIC" -o -iname "*.heif" -o -iname "*.HEIF" -o -iname "*.png" -o -iname "*.PNG" \) ! -name "*.webp" ! -name "*.avif" | while read -r file; do
        convert_image "$file"
    done
fi

# Services
for service_dir in "$BASE_DIR/elagage" "$BASE_DIR/abattage" "$BASE_DIR/dessouchage" "$BASE_DIR/entretien"; do
    if [[ -d "$service_dir" ]]; then
        service_name=$(basename "$service_dir")
        echo -e "${YELLOW}📁 Traitement du dossier $service_name...${NC}"
        find "$service_dir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.heic" -o -iname "*.HEIC" -o -iname "*.heif" -o -iname "*.HEIF" -o -iname "*.png" -o -iname "*.PNG" \) ! -name "*.webp" ! -name "*.avif" ! -path "*/banner/*" | while read -r file; do
            convert_image "$file"
        done
    fi
done

echo -e "${GREEN}✨ Optimisation terminée !${NC}"

