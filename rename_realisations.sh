#!/bin/bash

# Script pour renommer les dossiers de réalisations avec des underscores

cd "$(dirname "$0")/public/images" || exit 1

echo "🔄 RENOMMAGE DES DOSSIERS DE RÉALISATIONS"
echo "=========================================="
echo ""

# Fonction pour renommer un dossier
rename_dir() {
    local old_name="$1"
    local new_name="$2"
    
    if [ -d "$old_name" ] && [ ! -d "$new_name" ]; then
        mv "$old_name" "$new_name"
        echo "  ✅ Renommé: $(basename "$old_name") → $(basename "$new_name")"
    elif [ -d "$new_name" ]; then
        echo "  ⚠️  Déjà renommé: $(basename "$new_name")"
    else
        echo "  ❌ Non trouvé: $(basename "$old_name")"
    fi
}

# ABATTAGE
echo "🌳 ABATTAGE"
echo "----------------------------------------"
rename_dir "abattage/Nos réalisation1_abattage par démontage d'un sapin proche d'une maison" \
           "abattage/nos_realisation_1_abattage_par_demontage_sapin_proche_maison"

rename_dir "abattage/Nos réalisation 2_abattage par démontage d'un Pin avec rétention dans un espace clos" \
           "abattage/nos_realisation_2_abattage_par_demontage_pin_avec_retention_espace_clos"

rename_dir "abattage/Nos réalisation 3_ abattage par démontage d'un hêtre pourpre malade avec rétention" \
           "abattage/nos_realisation_3_abattage_par_demontage_hetre_pourpre_malade_avec_retention"

# DESSOUCHAGE
echo ""
echo "🪵 DESSOUCHAGE"
echo "----------------------------------------"
rename_dir "dessouchage/Nos realisation 4_1" \
           "dessouchage/nos_realisation_4_1"

rename_dir "dessouchage/Nos realisation 4_2" \
           "dessouchage/nos_realisation_4_2"

rename_dir "dessouchage/Nos realisation 4_3" \
           "dessouchage/nos_realisation_4_3"

# ENTRETIEN
echo ""
echo "🌿 ENTRETIEN"
echo "----------------------------------------"
rename_dir "entretien/3_1 nos réalisation- titre; pose de gazon en rouleau" \
           "entretien/3_1_pose_gazon_rouleau"

rename_dir "entretien/3_2 nos realisation creation d'un gazon en semis" \
           "entretien/3_2_creation_gazon_semis"

rename_dir "entretien/3_3 nos réalisation  taille de haie et d'arbuste dans une residence" \
           "entretien/3_3_taille_haie_arbuste_residence"

echo ""
echo "✅ RENOMMAGE TERMINÉ"

