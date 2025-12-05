{% macro get_email_domains_by_locale() %}
    {% set locale_map = {
        'pl_PL': ['gmail.com', 'wp.pl', 'interia.pl', 'onet.pl', 'o2.pl', 'poczta.onet.pl', 'yahoo.com', 'outlook.com'],
        'en_US': ['gmail.com', 'yahoo.com', 'outlook.com', 'hotmail.com', 'aol.com', 'icloud.com', 'mail.com', 'protonmail.com']
    } %}
    {{ return(locale_map) }}
{% endmacro %}
