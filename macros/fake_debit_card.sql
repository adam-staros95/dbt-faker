{% macro fake_debit_card(seed_column, formatted=true) %}
    {{ return(adapter.dispatch('fake_debit_card', 'dbt_faker')(seed_column, formatted)) }}
{% endmacro %}
