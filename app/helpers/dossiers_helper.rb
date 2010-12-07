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
    acctypes = %w(geu fcs ivg img miu nai)
    if acctypes.include?(dossier.acctype_abbr)
      a = "#{dossier.acctype_name.humanize}"
      a+= " à #{dossier.terme} SA " unless dossier.terme.nil?
      a+= "par #{dossier.accmod_name}" if dossier.acctype_name == "naissance"
    else
      dossier.acctype_name
    end
  end
end
