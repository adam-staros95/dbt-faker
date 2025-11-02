{% macro get_last_names_by_locale() %}
    {% set locale_map = {
        'pl_PL': ['Kowalski', 'Nowak', 'Wiśniewski', 'Wójcik', 'Kamiński', 'Zieliński', 'Szymański', 'Woźniak'],
        'en_US': ['Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Garcia', 'Miller', 'Davis']
    } %}
    {{ return(locale_map) }}
{% endmacro %}

