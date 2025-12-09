{% macro get_cities_by_locale() %}
    {% set locale_map = {
        'pl_PL': [
            'Warszawa', 'Kraków', 'Wrocław', 'Poznań', 'Gdańsk', 'Szczecin', 'Bydgoszcz', 'Lublin',
            'Katowice', 'Białystok', 'Gdynia', 'Częstochowa', 'Radom', 'Sosnowiec', 'Toruń', 'Kielce',
            'Gliwice', 'Zabrze', 'Bytom', 'Olsztyn', 'Bielsko-Biała', 'Rzeszów', 'Ruda Śląska',
            'Rybnik', 'Tychy', 'Dąbrowa Górnicza', 'Płock', 'Elbląg', 'Opole', 'Gorzów Wielkopolski',
            'Wałbrzych', 'Zielona Góra', 'Włocławek', 'Tarnów', 'Chorzów', 'Kalisz', 'Koszalin',
            'Legnica', 'Grudziądz', 'Słupsk', 'Jaworzno', 'Jastrzębie-Zdrój', 'Nowy Sącz', 'Jelenia Góra'
        ],
        'en_US': [
            'New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix', 'Philadelphia', 'San Antonio',
            'San Diego', 'Dallas', 'San Jose', 'Austin', 'Jacksonville', 'Fort Worth', 'Columbus',
            'Charlotte', 'San Francisco', 'Indianapolis', 'Seattle', 'Denver', 'Washington', 'Boston',
            'El Paso', 'Detroit', 'Nashville', 'Portland', 'Oklahoma City', 'Las Vegas', 'Memphis',
            'Louisville', 'Baltimore', 'Milwaukee', 'Albuquerque', 'Tucson', 'Fresno', 'Sacramento',
            'Kansas City', 'Mesa', 'Atlanta', 'Omaha', 'Colorado Springs', 'Raleigh', 'Virginia Beach',
            'Miami', 'Oakland', 'Minneapolis', 'Tulsa', 'Cleveland', 'Wichita', 'Arlington', 'Tampa'
        ]
    } %}
    {{ return(locale_map) }}
{% endmacro %}
