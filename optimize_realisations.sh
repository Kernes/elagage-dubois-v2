#!/bin/bash

# Script pour optimiser les images de réalisations
# Convertit en WebP/AVIF et supprime les anciens formats

set -e

# Aller dans le répertoire des images
cd "$(dirname "$0")/public/images" || exit 1

QUALITY_JPG=85
QUALITY_WEBP=85
QUALITY_AVIF=50

echo "🖼️  OPTIMISATION DES IMAGES DE RÉALISATIONS"
echo "=========================================="
echo ""

# Fonction pour optimiser une image
optimize_image() {
    local input_file="$1"
    local base_name="${input_file%.*}"
    local ext="${input_file##*.}"
    
    echo "  📸 Traitement: $(basename "$input_file")"
    
    # Convertir en JPG si nécessaire (HEIC, PNG)
    if [[ "$ext" == "heic" ]] || [[ "$ext" == "HEIC" ]] || [[ "$ext" == "png" ]] || [[ "$ext" == "PNG" ]]; then
        if [ ! -f "${base_name}.jpg" ]; then
            magick convert "$input_file" -quality $QUALITY_JPG "${base_name}.jpg"
            echo "    ✅ Converti en JPG"
        fi
    fi
    
    # Créer WebP et AVIF à partir du JPG
    local jpg_file="${base_name}.jpg"
    if [ ! -f "$jpg_file" ]; then
        jpg_file="$input_file"
    fi
    
    if [ ! -f "${base_name}.webp" ]; then
        magick convert "$jpg_file" -quality $QUALITY_WEBP "${base_name}.webp"
        echo "    ✅ Créé WebP"
    fi
    
    if [ ! -f "${base_name}.avif" ]; then
        magick convert "$jpg_file" -quality $QUALITY_AVIF "${base_name}.avif"
        echo "    ✅ Créé AVIF"
    fi
}

# Fonction pour traiter un dossier
process_directory() {
    local dir="$1"
    local service_name="$2"
    
    if [ ! -d "$dir" ]; then
        return
    fi
    
    echo ""
    echo "📁 Dossier: $dir"
    echo "----------------------------------------"
    
    # Traiter toutes les images
    shopt -s nullglob
    for img in "$dir"/*.{jpg,jpeg,JPG,JPEG,heic,HEIC,png,PNG}; do
        if [ -f "$img" ]; then
            optimize_image "$img"
        fi
    done
    shopt -u nullglob
    
    # Supprimer les anciens formats (garder seulement JPG, WebP, AVIF)
    echo "  🗑️  Suppression des anciens formats..."
    find "$dir" -type f \( -name "*.heic" -o -name "*.HEIC" -o -name "*.png" -o -name "*.PNG" \) -delete 2>/dev/null || true
    echo "    ✅ Anciens formats supprimés"
}

# ABATTAGE
echo "🌳 ABATTAGE"
echo "----------------------------------------"
process_directory "abattage/Nos réalisation1_abattage par démontage d'un sapin proche d'une maison" "abattage"
process_directory "abattage/Nos réalisation 2_abattage par démontage d'un Pin avec rétention dans un espace clos" "abattage"
process_directory "abattage/Nos réalisation 3_ abattage par démontage d'un hêtre pourpre malade avec rétention" "abattage"

# DESSOUCHAGE
echo ""
echo "🪵 DESSOUCHAGE"
echo "----------------------------------------"
process_directory "dessouchage/Nos realisation 4_1" "dessouchage"
process_directory "dessouchage/Nos realisation 4_2" "dessouchage"
process_directory "dessouchage/Nos realisation 4_3" "dessouchage"

# ENTRETIEN
echo ""
echo "🌿 ENTRETIEN"
echo "----------------------------------------"
process_directory "entretien/3_1 nos réalisation- titre; pose de gazon en rouleau" "entretien"
process_directory "entretien/3_2 nos realisation creation d'un gazon en semis" "entretien"
process_directory "entretien/3_3 nos réalisation  taille de haie et d'arbuste dans une residence" "entretien"

echo ""
echo "✅ OPTIMISATION TERMINÉE"
echo ""
echo "📊 Résumé:"
echo "  - Toutes les images ont été converties en WebP/AVIF"
echo "  - Les anciens formats (HEIC/PNG) ont été supprimés"
echo "  - Les images JPG sont conservées comme fallback"

