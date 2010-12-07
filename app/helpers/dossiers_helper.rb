# encoding: utf-8
module DossiersHelper

  def autotab
    @current_tab ||= 0
    @current_tab += 1
  end

  def dossier_patient_age(dossier)
    if dossier.age
      haml_concat dossier.age
    else
      haml_concat dossier.patient_age
    end
  end

  def dossier_csv_headers
    Dossier::CSV_HEADERS.join(',')
  end

  def gestite_in_words(dossier)
    grs_ant = %w[fcs geu miu ivg img]
    out = "Gestité : G#{dossier.gestite}"
    strings = [nil,nil,nil,nil,nil]
    if dossier.gestite == dossier.nai + 1
      out
    else
      grs_ant.each_with_index do |ant, index|
        atcd = dossier.send(ant)
        strings[index] = "#{atcd} #{ant.upcase}" unless atcd == 0
      end
      out+= " (dont "
      out+= strings.compact.to_sentence
      out+= ")"
    end
  end

  def evolution(dossier)
    acctypes = %w(GEU FCS IVG IMG MIU NAI)
    if acctypes.include?(dossier.acctype_abbr)
      a = "#{dossier.acctype_name.capitalize}"
      a+= " à #{dossier.terme} SA " unless dossier.terme.nil?
      a+= "par #{dossier.accmod_name}" if dossier.acctype_name == "naissance"
    else
      dossier.acctype_name
    end
  end

  def atcds(dossier, field)
    case dossier.send(field)
    when 0 then dossier.send("comm_#{field}")
    when 1 then "aucun"
    else "non précisé"
    end
  end

  def cigarettes(dossier)
    cigJour = [ 
      'ne fume pas',
      "jusqu'à 5 ",
      '5 à 10 ',
      'plus de 10 ',
      'consommation inconnue']
    unless dossier.tabac.nil?
      case dossier.tabac
        when 0; cigJour[0]
        when 4; cigJour[4]
        else "fume " + cigJour[dossier.tabac] + "cigarettes par jour"
      end
    end
  end

  def boisson(dossier)
    boiJour = [ 
      'ne boit pas',
      'occasionnelle (moins de 2 ',
      'fréquente (plus de 2 ',
      'consommation inconnue']
    unless dossier.alcool.nil?
      case dossier.alcool
        when 0; boiJour[0]
        when 3; boiJour[3]
        else "consommation " + boiJour[dossier.alcool] + "verres par jour)"
      end
    end
  end
end
