#!/bin/bash
get_battery_combined_percent() {
    total_charge=$(expr $(acpi -b | awk '{print $4}' | grep -Eo "[0-9]+" | paste -sd+ | bc))
    battery_number=$(acpi -b | wc -l)
    percent=$(expr $total_charge / $battery_number)

    if [ "$percent" -le 10 ]; then
        printf " %s%%" "$percent"
    elif [ "$percent" -ge 11 ] && [ "$percent" -le 20 ]; then
        printf " %s%%" "$percent"
    elif [ "$percent" -ge 21 ] && [ "$percent" -le 30 ]; then
        printf " %s%%" "$percent"
    elif [ "$percent" -ge 31 ] && [ "$percent" -le 40 ]; then
        printf " %s%%" "$percent"
    elif [ "$percent" -ge 41 ] && [ "$percent" -le 50 ]; then
        printf " %s%%" "$percent"
    elif [ "$percent" -ge 51 ] && [ "$percent" -le 60 ]; then
        printf " %s%%" "$percent"
    elif [ "$percent" -ge 61 ] && [ "$percent" -le 70 ]; then
        printf " %s%%" "$percent"
    elif [ "$percent" -ge 71 ] && [ "$percent" -le 80 ]; then
        printf " %s%%" "$percent"
    elif [ "$percent" -ge 81 ] && [ "$percent" -le 90 ]; then
        printf " %s%%" "$percent"
    else
        printf " %s%%" "$percent"
    fi
}

get_battery_combined_percent
