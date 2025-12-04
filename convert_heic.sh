#!/bin/bash

# Script pour convertir des fichiers HEIC en JPG, AVIF et WebP
# Usage: ./convert_heic.sh fichier.heic [options]
# Options:
#   -o, --output-dir DIR    Répertoire de sortie (défaut: même répertoire que le fichier source)
#   -q, --quality QUALITY    Qualité JPG/WebP (0-100, défaut: 85)
#   -a, --avif-quality QUALITY  Qualité AVIF (0-100, défaut: 50)
#   --jpg-only              Convertir uniquement en JPG
#   --webp-only             Convertir uniquement en WebP
#   --avif-only             Convertir uniquement en AVIF
#   --all                   Convertir en JPG, WebP et AVIF (défaut)

set -e

# Valeurs par défaut
QUALITY=85
AVIF_QUALITY=50
OUTPUT_DIR=""
FORMATS="jpg webp avif"

# Fonction d'aide
show_help() {
    cat << EOF
Usage: $0 fichier.heic [options]

Options:
  -o, --output-dir DIR      Répertoire de sortie (défaut: même répertoire que le fichier source)
  -q, --quality QUALITY     Qualité JPG/WebP (0-100, défaut: 85)
  -a, --avif-quality QUALITY Qualité AVIF (0-100, défaut: 50)
  --jpg-only                Convertir uniquement en JPG
  --webp-only               Convertir uniquement en WebP
  --avif-only               Convertir uniquement en AVIF
  --all                     Convertir en JPG, WebP et AVIF (défaut)
  -h, --help                Afficher cette aide

Exemples:
  $0 photo.heic
  $0 photo.heic --quality 90
  $0 photo.heic --output-dir ./converted
  $0 photo.heic --jpg-only --quality 95
EOF
}

# Parse des arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -o|--output-dir)
            OUTPUT_DIR="$2"
            shift 2
            ;;
        -q|--quality)
            QUALITY="$2"
            shift 2
            ;;
        -a|--avif-quality)
            AVIF_QUALITY="$2"
            shift 2
            ;;
        --jpg-only)
            FORMATS="jpg"
            shift
            ;;
        --webp-only)
            FORMATS="webp"
            shift
            ;;
        --avif-only)
            FORMATS="avif"
            shift
            ;;
        --all)
            FORMATS="jpg webp avif"
            shift
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *.heic|*.HEIC)
            INPUT_FILE="$1"
            shift
            ;;
        *)
            echo "Option inconnue: $1"
            show_help
            exit 1
            ;;
    esac
done

# Vérifier qu'un fichier a été fourni
if [[ -z "$INPUT_FILE" ]]; then
    echo "❌ Erreur: Aucun fichier HEIC fourni"
    show_help
    exit 1
fi

# Vérifier que le fichier existe
if [[ ! -f "$INPUT_FILE" ]]; then
    echo "❌ Erreur: Le fichier '$INPUT_FILE' n'existe pas"
    exit 1
fi

# Déterminer le répertoire de sortie
if [[ -z "$OUTPUT_DIR" ]]; then
    OUTPUT_DIR=$(dirname "$INPUT_FILE")
fi

# Créer le répertoire de sortie s'il n'existe pas
mkdir -p "$OUTPUT_DIR"

# Nom de base du fichier (sans extension)
BASENAME=$(basename "$INPUT_FILE" .heic)
BASENAME=$(basename "$BASENAME" .HEIC)

echo "🔄 Conversion de: $INPUT_FILE"
echo "📁 Répertoire de sortie: $OUTPUT_DIR"
echo "🎨 Formats: $FORMATS"
echo ""

# Conversion en JPG
if [[ "$FORMATS" == *"jpg"* ]]; then
    OUTPUT_JPG="$OUTPUT_DIR/${BASENAME}.jpg"
    echo "📸 Conversion en JPG (qualité: $QUALITY)..."
    magick convert "$INPUT_FILE" -quality "$QUALITY" "$OUTPUT_JPG"
    echo "✅ JPG créé: $OUTPUT_JPG"
    echo ""
fi

# Conversion en WebP
if [[ "$FORMATS" == *"webp"* ]]; then
    OUTPUT_WEBP="$OUTPUT_DIR/${BASENAME}.webp"
    echo "🖼️  Conversion en WebP (qualité: $QUALITY)..."
    magick convert "$INPUT_FILE" -quality "$QUALITY" "$OUTPUT_WEBP"
    echo "✅ WebP créé: $OUTPUT_WEBP"
    echo ""
fi

# Conversion en AVIF
if [[ "$FORMATS" == *"avif"* ]]; then
    OUTPUT_AVIF="$OUTPUT_DIR/${BASENAME}.avif"
    echo "🎨 Conversion en AVIF (qualité: $AVIF_QUALITY)..."
    magick convert "$INPUT_FILE" -quality "$AVIF_QUALITY" "$OUTPUT_AVIF"
    echo "✅ AVIF créé: $OUTPUT_AVIF"
    echo ""
fi

echo "✨ Conversion terminée !"

