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
end
