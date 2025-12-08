{% macro get_counties_by_locale() %}
    {% set locale_map = {
        'pl_PL': [
            'Warszawa', 'Kraków', 'Wrocław', 'Poznań', 'Gdańsk', 'Szczecin', 'Bydgoszcz', 'Lublin',
            'Katowice', 'Białystok', 'Gdynia', 'Częstochowa', 'Radom', 'Sosnowiec', 'Toruń', 'Kielce',
            'Gliwice', 'Zabrze', 'Bytom', 'Olsztyn', 'Bielsko-Biała', 'Rzeszów', 'Ruda Śląska',
            'Rybnik', 'Tychy', 'Dąbrowa Górnicza', 'Płock', 'Elbląg', 'Opole', 'Gorzów Wielkopolski',
            'Wałbrzych', 'Zielona Góra', 'Włocławek', 'Tarnów', 'Chorzów', 'Kalisz', 'Koszalin',
            'Legnica', 'Grudziądz', 'Słupsk', 'Jaworzno', 'Jastrzębie-Zdrój', 'Nowy Sącz', 'Jelenia Góra',
            'Ostrowiec Świętokrzyski', 'Stalowa Wola', 'Mielec', 'Tarnobrzeg', 'Przemyśl', 'Stargard',
            'Świnoujście', 'Kołobrzeg', 'Wejherowo', 'Malbork', 'Ostróda', 'Iława', 'Giżycko', 'Ełk',
            'Suwałki', 'Augustów', 'Łomża', 'Ostrołęka', 'Pułtusk', 'Ciechanów', 'Płońsk', 'Sochaczew',
            'Żyrardów', 'Grodzisk Mazowiecki', 'Piaseczno', 'Otwock', 'Mińsk Mazowiecki', 'Siedlce',
            'Łuków', 'Radzyń Podlaski', 'Biała Podlaska', 'Chełm', 'Zamość', 'Tomaszów Lubelski',
            'Hrubieszów', 'Biłgoraj', 'Jarosław', 'Sanok', 'Lesko', 'Ustrzyki Dolne', 'Krosno', 'Jasło',
            'Gorlice', 'Nowy Targ', 'Zakopane', 'Sucha Beskidzka', 'Wadowice', 'Oświęcim', 'Chrzanów',
            'Olkusz', 'Zawiercie', 'Myszków', 'Kłobuck', 'Lubliniec', 'Żory', 'Racibórz', 'Wodzisław Śląski',
            'Pszczyna', 'Garwolin'
        ],
        'en_US': [
            'Los Angeles', 'Cook', 'Harris', 'Maricopa', 'San Diego', 'Orange', 'Miami-Dade', 'Dallas',
            'King', 'Riverside', 'San Bernardino', 'Wayne', 'Tarrant', 'Santa Clara', 'Broward',
            'Clark', 'Bexar', 'New York', 'Alameda', 'Sacramento', 'Queens', 'Fulton', 'Mecklenburg',
            'Cuyahoga', 'Hillsborough', 'Hennepin', 'Marion', 'Milwaukee', 'Baltimore', 'Jefferson',
            'Shelby', 'Wake', 'Duval', 'Fairfax', 'Montgomery', 'Pinellas', 'Palm Beach', 'Travis',
            'Collin', 'Fort Bend', 'Gwinnett', 'Cobb', 'DeKalb', 'Forsyth', 'Williamson', 'Denton',
            'Prince Georges', 'Arlington', 'Loudoun', 'Suffolk', 'Nassau', 'Westchester', 'Erie',
            'Monroe', 'Onondaga', 'Albany', 'Dutchess', 'Rockland', 'Bergen', 'Essex', 'Hudson',
            'Union', 'Middlesex', 'Monmouth', 'Ocean', 'Passaic', 'Morris', 'Somerset'
        ]
    } %}
    {{ return(locale_map) }}
{% endmacro %}
