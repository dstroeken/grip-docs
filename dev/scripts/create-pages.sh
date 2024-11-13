#!/bin/bash

cd ..

# Function to generate the command from the filename
generate_command() {
  local filename=$(basename "$1" .html)
  local command="process_file \"$filename\""
  echo "$command"
  echo "$command" >> generated_commands.log
}

# Check if the base path argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <base_path>"
  echo "Example: $0 docs/calculator/2023/nl"
  exit 1
fi

# Base path from the first argument
base_path="$1"

# List of HTML files (relative paths)
files=(
  "pages/toc.html"
  "pages/1-home.html"
  "pages/2-sources.html"
  "pages/2-1-1-input-source.html"
  "pages/2-1-2-source-sector-group-:group.html"
  "pages/2-1-3-source-sector-:emission_calculation_method.html"
  "pages/2-2-building-create.html"
  "pages/2-3-1-tvp-diurnal-create.html"
  "pages/2-3-2-tvp-monthly-create.html"
  "pages/3-calculation-points.html"
  "pages/4-calculation-jobs.html"
  "pages/5-1-results_scenarios.html"
  "pages/5-2-results_summary.html"
  "pages/5-3-1-results_cl.html"
  "pages/5-3-2-results_distribution.html"
  "pages/5-3-3-results_markers.html"
  "pages/5-3-4-results_habitat_and_species.html"
  "pages/5-3-4-results_procurement_policy.html"
  "pages/6-export.html"
  "pages/7-next-steps.html"
)

# Arrays for :emission_calculation_method and :group values
emission_calculation_methods=(
  "SRM2_ROAD"
  "SHIPPING_MARITIME_DOCKED"
  "FARM_ANIMAL_HOUSING"
  "SHIPPING_MARITIME_MARITIME"
  "GENERIC"
  "SHIPPING_MARITIME_INLAND"
  "SHIPPING_INLAND"
  "OFFROAD_MOBILE"
  "SHIPPING_INLAND_DOCKED"
  "COLD_START_OTHER"
  "COLD_START_PARKING_GARAGE"
  "FARMLAND"
)

groups=(
  "RAIL_TRANSPORTATION"
  "ROAD_TRANSPORTATION"
  "MOBILE_EQUIPMENT"
  "LIVE_AND_WORK"
  "INDUSTRY"
  "AGRICULTURE"
  "SHIPPING"
  "FARMLAND"
  "OTHER"
  "AVIATION"
  "ENERGY"
)

# Function to create .md file if it doesn't already exist
create_md_file() {
  local source_html="$1"
  local target_md="$2"

  # Extract the directory from the target_md path
  target_dir=$(dirname "$target_md")

  # Ensure the directory exists
  if [ ! -d "$target_dir" ]; then
    mkdir -p "$target_dir"
    echo "Created directory: $target_dir"
  fi

  # Create the .md file if it doesn't exist
  if [ ! -f "$target_md" ]; then
    echo "$(basename "$target_md" .md)" > "$target_md"
    echo "Created: $target_md"
  else
    echo "Ignored: $target_md (already exists)"
  fi
}

# Normalize base path to avoid issues with trailing slashes
base_path="${base_path%/}"

for html_file in "${files[@]}"; do
  if [[ "$html_file" == *":emission_calculation_method.html" ]]; then
    for method in "${emission_calculation_methods[@]}"; do
      md_path="${base_path}/pages/$(basename "$html_file" .html | sed "s/:emission_calculation_method/$method/").md"
      create_md_file "$html_file" "$md_path"
    done
  elif [[ "$html_file" == *":group.html" ]]; then
    for group in "${groups[@]}"; do
      md_path="${base_path}/pages/$(basename "$html_file" .html | sed "s/:group/$group/").md"
      create_md_file "$html_file" "$md_path"
    done
  else
    md_path="${base_path}/pages/$(basename "$html_file" .html).md"
    create_md_file "$html_file" "$md_path"
  fi
done
