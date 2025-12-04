#!/bin/bash

# Script pour optimiser les images selon leur contexte d'affichage réel
# Utilise ImageMagick pour redimensionner et réoptimiser

IMAGES_DIR="public/images"
QUALITY_JPG=85
QUALITY_WEBP=85
QUALITY_AVIF=50

echo "🖼️  Optimisation des images selon leur contexte d'affichage..."
echo ""

# Activer nullglob pour éviter les erreurs avec les patterns sans correspondance
shopt -s nullglob

# Fonction pour optimiser une image
optimize_image() {
    local input_file="$1"
    local max_width="$2"
    local base_name="${input_file%.*}"
    local ext="${input_file##*.}"
    
    # Déterminer les fichiers de sortie
    local output_webp="${base_name}.webp"
    local output_avif="${base_name}.avif"
    
    # Trouver le fichier source (priorité: JPG > PNG > HEIC > WebP > AVIF)
    local source_file=""
    if [ -f "${base_name}.jpg" ]; then
        source_file="${base_name}.jpg"
    elif [ -f "${base_name}.jpeg" ]; then
        source_file="${base_name}.jpeg"
    elif [ -f "${base_name}.png" ]; then
        source_file="${base_name}.png"
    elif [ -f "${base_name}.heic" ]; then
        source_file="${base_name}.heic"
    elif [ -f "${base_name}.heif" ]; then
        source_file="${base_name}.heif"
    elif [ -f "$output_webp" ]; then
        source_file="$output_webp"
    elif [ -f "$output_avif" ]; then
        source_file="$output_avif"
    else
        return
    fi
    
    # Obtenir les dimensions originales
    local original_size=$(magick identify -format "%wx%h" "$source_file" 2>/dev/null)
    if [ -z "$original_size" ]; then
        return
    fi
    
    local original_width=$(echo "$original_size" | cut -d'x' -f1)
    
    # Si l'image est déjà plus petite que la taille cible, on la garde telle quelle
    if [ "$original_width" -le "$max_width" ]; then
        return
    fi
    
    # Redimensionner et optimiser WebP
    if [ -f "$output_webp" ]; then
        magick "$source_file" -resize "${max_width}x>" -quality $QUALITY_WEBP "$output_webp" 2>/dev/null
        if [ $? -eq 0 ]; then
            echo "  ✓ WebP redimensionné: $(basename "$output_webp") (${original_width}px → ${max_width}px)"
        fi
    fi
    
    # Redimensionner et optimiser AVIF
    if [ -f "$output_avif" ]; then
        magick "$source_file" -resize "${max_width}x>" -quality $QUALITY_AVIF "$output_avif" 2>/dev/null
        if [ $? -eq 0 ]; then
            echo "  ✓ AVIF redimensionné: $(basename "$output_avif") (${original_width}px → ${max_width}px)"
        fi
    fi
}

# Fonction pour traiter tous les fichiers d'un pattern
process_pattern() {
    local pattern="$1"
    local max_width="$2"
    local count=0
    
    for ext in webp avif; do
        for img in $pattern."$ext"; do
            if [ -f "$img" ]; then
                optimize_image "$img" "$max_width"
                count=$((count + 1))
            fi
        done
    done
    
    if [ $count -eq 0 ]; then
        # Essayer avec les sources originales
        for ext in jpg jpeg png heic heif; do
            for img in $pattern."$ext"; do
                if [ -f "$img" ]; then
                    optimize_image "$img" "$max_width"
                    count=$((count + 1))
                fi
            done
        done
    fi
}

# 1. Services Principaux (Notre Art, Votre Satisfaction) - h-56 = 224px, cards ~400px
echo "📦 Services Principaux (homepage 2_*)..."
for img_base in "$IMAGES_DIR/homepage/2_"*; do
    if [ -f "${img_base%.*}.webp" ] || [ -f "${img_base%.*}.avif" ] || [ -f "${img_base%.*}.jpg" ]; then
        base="${img_base%.*}"
        echo "  Processing: $(basename "$base")"
        optimize_image "$base.webp" 400 2>/dev/null || optimize_image "$base.avif" 400 2>/dev/null || optimize_image "$base.jpg" 400 2>/dev/null
    fi
done

# 2. Pourquoi Choisir - h-48 = 192px, cards ~400px
echo ""
echo "📦 Pourquoi Choisir (elagage 3-*, abattage 4_*, dessouchage 5_*, entretien 4_*)..."
for dir in elagage abattage dessouchage entretien; do
    if [ "$dir" = "elagage" ]; then
        # Pattern avec tiret pour élagage
        for img_base in "$IMAGES_DIR/$dir/3-"*; do
            base="${img_base%.*}"
            if [ -f "${base}.webp" ] || [ -f "${base}.avif" ] || [ -f "${base}.jpg" ]; then
                echo "  Processing: $(basename "$base")"
                optimize_image "${base}.webp" 400 2>/dev/null || optimize_image "${base}.avif" 400 2>/dev/null || optimize_image "${base}.jpg" 400 2>/dev/null
            fi
        done
    elif [ "$dir" = "abattage" ]; then
        for img_base in "$IMAGES_DIR/$dir/4_"*; do
            base="${img_base%.*}"
            if [ -f "${base}.webp" ] || [ -f "${base}.avif" ] || [ -f "${base}.jpg" ]; then
                echo "  Processing: $(basename "$base")"
                optimize_image "${base}.webp" 400 2>/dev/null || optimize_image "${base}.avif" 400 2>/dev/null || optimize_image "${base}.jpg" 400 2>/dev/null
            fi
        done
    elif [ "$dir" = "dessouchage" ]; then
        for img_base in "$IMAGES_DIR/$dir/pourquoi choisir notre service de dessouchage 5_"*; do
            base="${img_base%.*}"
            if [ -f "${base}.webp" ] || [ -f "${base}.avif" ] || [ -f "${base}.jpg" ]; then
                echo "  Processing: $(basename "$base")"
                optimize_image "${base}.webp" 400 2>/dev/null || optimize_image "${base}.avif" 400 2>/dev/null || optimize_image "${base}.jpg" 400 2>/dev/null
            fi
        done
    else
        for img_base in "$IMAGES_DIR/$dir/4_"*; do
            base="${img_base%.*}"
            if [ -f "${base}.webp" ] || [ -f "${base}.avif" ] || [ -f "${base}.jpg" ]; then
                echo "  Processing: $(basename "$base")"
                optimize_image "${base}.webp" 400 2>/dev/null || optimize_image "${base}.avif" 400 2>/dev/null || optimize_image "${base}.jpg" 400 2>/dev/null
            fi
        done
    fi
done

# 3. Techniques - h-64 = 256px, cards ~600px sur desktop
echo ""
echo "📦 Techniques (elagage 1-*, abattage 2_*, dessouchage 2_*, entretien 2_*)..."
for dir in elagage abattage dessouchage entretien; do
    if [ "$dir" = "elagage" ]; then
        # Pattern avec tiret pour élagage
        for img_base in "$IMAGES_DIR/$dir/1-"*; do
            base="${img_base%.*}"
            if [ -f "${base}.webp" ] || [ -f "${base}.avif" ] || [ -f "${base}.jpg" ]; then
                echo "  Processing: $(basename "$base")"
                optimize_image "${base}.webp" 600 2>/dev/null || optimize_image "${base}.avif" 600 2>/dev/null || optimize_image "${base}.jpg" 600 2>/dev/null
            fi
        done
    elif [ "$dir" = "dessouchage" ]; then
        # Pattern spécial pour dessouchage
        for img_base in "$IMAGES_DIR/$dir/Nos technique de dessouchage 2_"*; do
            base="${img_base%.*}"
            if [ -f "${base}.webp" ] || [ -f "${base}.avif" ] || [ -f "${base}.jpg" ]; then
                echo "  Processing: $(basename "$base")"
                optimize_image "${base}.webp" 600 2>/dev/null || optimize_image "${base}.avif" 600 2>/dev/null || optimize_image "${base}.jpg" 600 2>/dev/null
            fi
        done
    else
        for img_base in "$IMAGES_DIR/$dir/2_"*; do
            base="${img_base%.*}"
            if [ -f "${base}.webp" ] || [ -f "${base}.avif" ] || [ -f "${base}.jpg" ]; then
                echo "  Processing: $(basename "$base")"
                optimize_image "${base}.webp" 600 2>/dev/null || optimize_image "${base}.avif" 600 2>/dev/null || optimize_image "${base}.jpg" 600 2>/dev/null
            fi
        done
    fi
done

# 4. Hero homepage galerie - aspect-[4/5] dans ~300px
echo ""
echo "📦 Hero homepage galerie (1_*)..."
for img_base in "$IMAGES_DIR/homepage/1_"*; do
    base="${img_base%.*}"
    if [ -f "${base}.webp" ] || [ -f "${base}.avif" ] || [ -f "${base}.jpg" ]; then
        echo "  Processing: $(basename "$base")"
        optimize_image "${base}.webp" 400 2>/dev/null || optimize_image "${base}.avif" 400 2>/dev/null || optimize_image "${base}.jpg" 400 2>/dev/null
    fi
done

# 5. Services secondaires - h-40 = 160px
echo ""
echo "📦 Services secondaires (homepage 3_*)..."
for img_base in "$IMAGES_DIR/homepage/3_"*; do
    base="${img_base%.*}"
    if [ -f "${base}.webp" ] || [ -f "${base}.avif" ] || [ -f "${base}.jpg" ]; then
        echo "  Processing: $(basename "$base")"
        optimize_image "${base}.webp" 400 2>/dev/null || optimize_image "${base}.avif" 400 2>/dev/null || optimize_image "${base}.jpg" 400 2>/dev/null
    fi
done

# 6. Galerie réalisations - aspect-square, max 800px
echo ""
echo "📦 Galerie réalisations (homepage 5_*)..."
for img_base in "$IMAGES_DIR/homepage/5_"*; do
    base="${img_base%.*}"
    if [ -f "${base}.webp" ] || [ -f "${base}.avif" ] || [ -f "${base}.jpg" ]; then
        echo "  Processing: $(basename "$base")"
        optimize_image "${base}.webp" 800 2>/dev/null || optimize_image "${base}.avif" 800 2>/dev/null || optimize_image "${base}.jpg" 800 2>/dev/null
    fi
done

# 7. Introduction services - large images, max 800px
echo ""
echo "📦 Introduction services..."
for dir in elagage abattage dessouchage entretien; do
    for img_base in "$IMAGES_DIR/$dir/1"*; do
        base="${img_base%.*}"
        filename=$(basename "$base")
        if [[ ! "$filename" =~ ^(1-|1_) ]] && ([ -f "${base}.webp" ] || [ -f "${base}.avif" ] || [ -f "${base}.jpg" ]); then
            echo "  Processing: $filename"
            optimize_image "${base}.webp" 800 2>/dev/null || optimize_image "${base}.avif" 800 2>/dev/null || optimize_image "${base}.jpg" 800 2>/dev/null
        fi
    done
done

echo ""
echo "✅ Optimisation terminée !"
echo ""
echo "📊 Statistiques des fichiers optimisés:"
du -sh "$IMAGES_DIR"/*/*.{webp,avif} 2>/dev/null | tail -1

