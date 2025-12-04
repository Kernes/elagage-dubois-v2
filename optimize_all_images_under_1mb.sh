#!/bin/bash

# Script pour optimiser toutes les images sous 1 Mo

set -e

cd "$(dirname "$0")/public/images" || exit 1

MAX_SIZE=1048576  # 1 Mo en octets
QUALITY_WEBP_START=75
QUALITY_AVIF_START=40
QUALITY_JPG_START=80

echo "🖼️  OPTIMISATION DE TOUTES LES IMAGES SOUS 1 MO"
echo "================================================"
echo ""

# Fonction pour optimiser une image
optimize_image() {
    local file="$1"
    local ext="${file##*.}"
    local base="${file%.*}"
    
    # Vérifier la taille actuelle
    local current_size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null)
    
    if [ "$current_size" -lt "$MAX_SIZE" ]; then
        echo "  ✓ $(basename "$file") : $(numfmt --to=iec-i --suffix=B "$current_size") (déjà < 1 Mo)"
        return 0
    fi
    
    echo "  🔧 Optimisation: $(basename "$file") ($(numfmt --to=iec-i --suffix=B "$current_size"))"
    
    # Optimiser selon le type
    case "$ext" in
        webp|WEBP)
            local quality=$QUALITY_WEBP_START
            local temp_file="${base}_temp.webp"
            
            while [ "$current_size" -ge "$MAX_SIZE" ] && [ "$quality" -gt 20 ]; do
                magick "$file" -quality "$quality" "$temp_file"
                current_size=$(stat -f%z "$temp_file" 2>/dev/null || stat -c%s "$temp_file" 2>/dev/null)
                
                if [ "$current_size" -lt "$MAX_SIZE" ]; then
                    mv "$temp_file" "$file"
                    echo "    ✅ Optimisé à qualité $quality : $(numfmt --to=iec-i --suffix=B "$current_size")"
                    return 0
                fi
                
                quality=$((quality - 5))
            done
            
            # Si toujours trop gros, redimensionner
            if [ "$current_size" -ge "$MAX_SIZE" ]; then
                local width=$(magick identify -format "%w" "$file")
                local height=$(magick identify -format "%h" "$file")
                local new_width=$width
                local new_height=$height
                
                while [ "$current_size" -ge "$MAX_SIZE" ] && [ "$new_width" -gt 800 ]; do
                    new_width=$((new_width * 9 / 10))
                    new_height=$((height * new_width / width))
                    magick "$file" -resize "${new_width}x${new_height}" -quality 75 "$temp_file"
                    current_size=$(stat -f%z "$temp_file" 2>/dev/null || stat -c%s "$temp_file" 2>/dev/null)
                done
                
                mv "$temp_file" "$file"
                echo "    ✅ Redimensionné et optimisé : $(numfmt --to=iec-i --suffix=B "$current_size")"
            else
                rm -f "$temp_file"
            fi
            ;;
            
        avif|AVIF)
            local quality=$QUALITY_AVIF_START
            local temp_file="${base}_temp.avif"
            
            while [ "$current_size" -ge "$MAX_SIZE" ] && [ "$quality" -gt 20 ]; do
                magick "$file" -quality "$quality" "$temp_file"
                current_size=$(stat -f%z "$temp_file" 2>/dev/null || stat -c%s "$temp_file" 2>/dev/null)
                
                if [ "$current_size" -lt "$MAX_SIZE" ]; then
                    mv "$temp_file" "$file"
                    echo "    ✅ Optimisé à qualité $quality : $(numfmt --to=iec-i --suffix=B "$current_size")"
                    return 0
                fi
                
                quality=$((quality - 5))
            done
            
            # Si toujours trop gros, redimensionner
            if [ "$current_size" -ge "$MAX_SIZE" ]; then
                local width=$(magick identify -format "%w" "$file")
                local height=$(magick identify -format "%h" "$file")
                local new_width=$width
                local new_height=$height
                
                while [ "$current_size" -ge "$MAX_SIZE" ] && [ "$new_width" -gt 800 ]; do
                    new_width=$((new_width * 9 / 10))
                    new_height=$((height * new_width / width))
                    magick "$file" -resize "${new_width}x${new_height}" -quality 40 "$temp_file"
                    current_size=$(stat -f%z "$temp_file" 2>/dev/null || stat -c%s "$temp_file" 2>/dev/null)
                done
                
                mv "$temp_file" "$file"
                echo "    ✅ Redimensionné et optimisé : $(numfmt --to=iec-i --suffix=B "$current_size")"
            else
                rm -f "$temp_file"
            fi
            ;;
            
        jpg|jpeg|JPG|JPEG)
            local quality=$QUALITY_JPG_START
            local temp_file="${base}_temp.jpg"
            
            while [ "$current_size" -ge "$MAX_SIZE" ] && [ "$quality" -gt 30 ]; do
                magick "$file" -quality "$quality" "$temp_file"
                current_size=$(stat -f%z "$temp_file" 2>/dev/null || stat -c%s "$temp_file" 2>/dev/null)
                
                if [ "$current_size" -lt "$MAX_SIZE" ]; then
                    mv "$temp_file" "$file"
                    echo "    ✅ Optimisé à qualité $quality : $(numfmt --to=iec-i --suffix=B "$current_size")"
                    return 0
                fi
                
                quality=$((quality - 5))
            done
            
            # Si toujours trop gros, redimensionner
            if [ "$current_size" -ge "$MAX_SIZE" ]; then
                local width=$(magick identify -format "%w" "$file")
                local height=$(magick identify -format "%h" "$file")
                local new_width=$width
                local new_height=$height
                
                while [ "$current_size" -ge "$MAX_SIZE" ] && [ "$new_width" -gt 800 ]; do
                    new_width=$((new_width * 9 / 10))
                    new_height=$((height * new_width / width))
                    magick "$file" -resize "${new_width}x${new_height}" -quality 75 "$temp_file"
                    current_size=$(stat -f%z "$temp_file" 2>/dev/null || stat -c%s "$temp_file" 2>/dev/null)
                done
                
                mv "$temp_file" "$file"
                echo "    ✅ Redimensionné et optimisé : $(numfmt --to=iec-i --suffix=B "$current_size")"
            else
                rm -f "$temp_file"
            fi
            ;;
    esac
}

# Compteurs
total_images=0
optimized_images=0
already_ok=0

# Traiter toutes les images dans tous les dossiers
echo "📁 Recherche des images..."
echo ""

for dir in abattage dessouchage elagage entretien homepage abattage/nos_* dessouchage/nos_* entretien/3_*; do
    if [ ! -d "$dir" ]; then
        continue
    fi
    
    echo "📂 Dossier: $dir"
    echo "----------------------------------------"
    
    shopt -s nullglob
    for img in "$dir"/*.{webp,avif,jpg,jpeg,JPG,JPEG}; do
        if [ -f "$img" ]; then
            total_images=$((total_images + 1))
            size_before=$(stat -f%z "$img" 2>/dev/null || stat -c%s "$img" 2>/dev/null)
            
            if [ "$size_before" -ge "$MAX_SIZE" ]; then
                optimize_image "$img"
                optimized_images=$((optimized_images + 1))
            else
                already_ok=$((already_ok + 1))
            fi
        fi
    done
    shopt -u nullglob
    
    echo ""
done

echo "✅ OPTIMISATION TERMINÉE"
echo ""
echo "📊 Statistiques:"
echo "  - Total d'images: $total_images"
echo "  - Images optimisées: $optimized_images"
echo "  - Images déjà < 1 Mo: $already_ok"
echo ""
echo "🔍 Vérification finale des images > 1 Mo..."
large_images=$(find . -type f \( -name "*.webp" -o -name "*.avif" -o -name "*.jpg" -o -name "*.jpeg" \) -size +1M 2>/dev/null | wc -l | tr -d ' ')
if [ "$large_images" -eq 0 ]; then
    echo "  ✅ Toutes les images font moins de 1 Mo !"
else
    echo "  ⚠️  $large_images image(s) font encore plus de 1 Mo"
    find . -type f \( -name "*.webp" -o -name "*.avif" -o -name "*.jpg" -o -name "*.jpeg" \) -size +1M -exec ls -lh {} \; 2>/dev/null | awk '{print "    - " $9 " : " $5}' || true
fi

