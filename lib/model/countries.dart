
class CountriesData {
    int id;
    String alpha2Code;
    String alpha3Code;
    List<String> altSpellings;
    double area;
    List<String> borders;
    List<String> callingCodes;
    String capital;
    String cioc;
    List<Currency> currencies;
    String demonym;
    String flag;
    double gini;
    List<Language> languages;
    List<double> latlng;
    String name;
    String nativeName;
    String numericCode;
    int population;
    String region;
    List<RegionalBloc> regionalBlocs;
    String subregion;
    List<String> timezones;
    List<String> topLevelDomain;
    Translations translations;

    CountriesData({this.alpha2Code, this.alpha3Code, this.altSpellings, this.area, this.borders, this.callingCodes, this.capital, this.cioc, this.currencies, this.demonym, this.flag, this.gini, this.languages, this.latlng, this.name, this.nativeName, this.numericCode, this.population, this.region, this.regionalBlocs, this.subregion, this.timezones, this.topLevelDomain, this.translations});

    factory CountriesData.fromJson(Map<String, dynamic> json) {
        return CountriesData(
            alpha2Code: json['alpha2Code'],
            alpha3Code: json['alpha3Code'],
            altSpellings: json['altSpellings'] != null ? new List<String>.from(json['altSpellings']) : null,
            area: json['area'] /*!= null ? double?.fromJson(json['area']) : null*/,
            borders: json['borders'] != null ? new List<String>.from(json['borders']) : null,
            callingCodes: json['callingCodes'] != null ? new List<String>.from(json['callingCodes']) : null,
            capital: json['capital'],
            cioc: json['cioc'] /*!= null ? String?.fromJson(json['cioc']) : null*/,
            currencies: json['currencies'] != null ? (json['currencies'] as List).map((i) => Currency.fromJson(i)).toList() : null,
            demonym: json['demonym'],
            flag: json['flag'],
            gini: json['gini'] /*!= null ? double?.fromJson(json['gini']) : null*/,
            languages: json['languages'] != null ? (json['languages'] as List).map((i) => Language.fromJson(i)).toList() : null,
            latlng: json['latlng'] != null ? new List<double>.from(json['latlng']) : null,
            name: json['name'],
            nativeName: json['nativeName'],
            numericCode: json['numericCode'] /*!= null ? String?.fromJson(json['numericCode']) : null*/,
            population: json['population'],
            region: json['region'],
            regionalBlocs: json['regionalBlocs'] != null ? (json['regionalBlocs'] as List).map((i) => RegionalBloc.fromJson(i)).toList() : null,
            subregion: json['subregion'],
            timezones: json['timezones'] != null ? new List<String>.from(json['timezones']) : null,
            topLevelDomain: json['topLevelDomain'] != null ? new List<String>.from(json['topLevelDomain']) : null,
            translations: json['translations'] != null ? Translations.fromJson(json['translations']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['alpha2Code'] = this.alpha2Code;
        data['alpha3Code'] = this.alpha3Code;
        data['capital'] = this.capital;
        data['demonym'] = this.demonym;
        data['flag'] = this.flag;
        data['name'] = this.name;
        data['nativeName'] = this.nativeName;
        data['population'] = this.population;
        data['region'] = this.region;
        data['subregion'] = this.subregion;
            data['altSpellings'] = this.altSpellings??"";

            data['area'] = this.area??"";

            data['borders'] = this.borders??"";

            data['callingCodes'] = this.callingCodes??"";

            data['cioc'] = this.cioc??"";

            data['currencies'] = this.currencies.map((v) => v.toJson()).toList()??"";

            data['gini'] = this.gini??"";

            data['languages'] = this.languages.map((v) => v.toJson()).toList()??"";

            data['latlng'] = this.latlng??"";

            data['numericCode'] = this.numericCode??"";

            data['regionalBlocs'] = this.regionalBlocs.map((v) => v.toJson()).toList()??"";

            data['timezones'] = this.timezones??"";

            data['topLevelDomain'] = this.topLevelDomain??"";

            data['translations'] = this.translations.toJson()??"";

        return data;
    }
}

class Language {
    String iso639_1;
    String iso639_2;
    String name;
    String nativeName;

    Language({this.iso639_1, this.iso639_2, this.name, this.nativeName});

    factory Language.fromJson(Map<String, dynamic> json) {
        return Language(
            iso639_1: json['iso639_1'],
            iso639_2: json['iso639_2'],
            name: json['name'],
            nativeName: json['nativeName'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['iso639_1'] = this.iso639_1;
        data['iso639_2'] = this.iso639_2;
        data['name'] = this.name;
        data['nativeName'] = this.nativeName;
        return data;
    }
}

class RegionalBloc {
    String acronym;
    String name;
    List<Object> otherAcronyms;
    List<String> otherNames;

    RegionalBloc({this.acronym, this.name, this.otherAcronyms, this.otherNames});

    factory RegionalBloc.fromJson(Map<String, dynamic> json) {
        return RegionalBloc(
            acronym: json['acronym'],
            name: json['name'],
            otherAcronyms: json['otherAcronyms']/* != null ? (json['otherAcronyms'] as List).map((i) => Object.fromJson(i)).toList() : null*/,
            otherNames: json['otherNames'] != null ? new List<String>.from(json['otherNames']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['acronym'] = this.acronym;
        data['name'] = this.name;
        if (this.otherAcronyms != null) {
            data['otherAcronyms'] = this.otherAcronyms/*.map((v) => v.toJson()).toList()*/;
        }
        if (this.otherNames != null) {
            data['otherNames'] = this.otherNames;
        }
        return data;
    }
}

class Translations {
    String it;
    String br;
    String de;
    String es;
    String fa;
    String fr;
    String hr;
    String ja;
    String nl;
    String pt;

    Translations({this.it, this.br, this.de, this.es, this.fa, this.fr, this.hr, this.ja, this.nl, this.pt});

    factory Translations.fromJson(Map<String, dynamic> json) {
        return Translations(
            it: json['`it`'],
            br: json['br'],
            de: json['de'],
            es: json['es'],
            fa: json['fa'],
            fr: json['fr'],
            hr: json['hr'],
            ja: json['ja'],
            nl: json['nl'],
            pt: json['pt'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['`it`'] = this.it;
        data['br'] = this.br;
        data['de'] = this.de;
        data['es'] = this.es;
        data['fa'] = this.fa;
        data['fr'] = this.fr;
        data['hr'] = this.hr;
        data['ja'] = this.ja;
        data['nl'] = this.nl;
        data['pt'] = this.pt;
        return data;
    }
}

class Currency {
    String code;
    String name;
    String symbol;

    Currency({this.code, this.name, this.symbol});

    factory Currency.fromJson(Map<String, dynamic> json) {
        return Currency(
            code: json['code'],
            name: json['name']/* != null ? String?.fromJson(json['name']) : null*/,
            symbol: json['symbol'] /*!= null ? String?.fromJson(json['symbol']) : null*/,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['code'] = this.code;
        if (this.name != null) {
            data['name'] = this.name/*.toJson()*/;
        }
        if (this.symbol != null) {
            data['symbol'] = this.symbol/*.toJson()*/;
        }
        return data;
    }
}