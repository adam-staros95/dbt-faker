{% macro get_streets_by_locale() %}
    {% set locale_map = {
        'pl_PL': [
            'Marszałkowska', 'Nowy Świat', 'Krakowskie Przedmieście', 'Aleje Jerozolimskie',
            'Grunwaldzka', 'Długa', 'Główna', 'Królewska', 'Warszawska', 'Słowackiego',
            'Mickiewicza', 'Sienkiewicza', 'Kościuszki', 'Piłsudskiego', 'Krótka',
            'Polna', 'Leśna', 'Kwiatowa', 'Słoneczna', 'Ogrodowa', 'Parkowa',
            'Spacerowa', 'Zielona', 'Cicha', 'Spokojna', 'Wiejska', 'Górna',
            'Dolna', 'Środkowa', 'Nowa', 'Stara', 'Szkolna', 'Kościelna',
            'Rynek', 'Rynkowa', 'Zamkowa', 'Mostowa', 'Nadbrzeżna', 'Portowa',
            'Fabryczna', 'Przemysłowa', 'Sportowa', 'Zdrowa', 'Wesoła', 'Szczęśliwa'
        ],
        'en_US': [
            'Main Street', 'Park Avenue', 'Oak Street', 'Elm Street', 'First Street', 'Second Street',
            'Third Street', 'Washington Street', 'Lincoln Avenue', 'Jefferson Street', 'Madison Avenue',
            'Broadway', 'Fifth Avenue', 'Church Street', 'Market Street', 'High Street', 'Chestnut Street',
            'Maple Avenue', 'Pine Street', 'Cedar Lane', 'River Road', 'Lake Drive', 'Hill Street',
            'Valley Road', 'Spring Street', 'Summer Avenue', 'Winter Lane', 'Sunset Boulevard', 'Sunrise Drive',
            'Ocean Avenue', 'Beach Road', 'Forest Lane', 'Garden Street', 'Rose Avenue', 'Lily Lane',
            'Creek Road', 'Bridge Street', 'Railroad Avenue', 'Station Road', 'School Street', 'College Avenue',
            'University Drive', 'Library Lane', 'Hospital Road', 'Park Lane', 'Grove Street', 'Orchard Avenue',
            'Farm Road', 'Country Lane', 'Meadow Street', 'Brook Avenue', 'Pond Road', 'Lakeview Drive'
        ]
    } %}
    {{ return(locale_map) }}
{% endmacro %}
