# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101124150327) do

  create_table "accmods", :force => true do |t|
    t.string "abbr"
    t.string "name"
  end

  create_table "acctypes", :force => true do |t|
    t.string  "abbr"
    t.string  "name"
    t.integer "dossiers_count"
  end

  create_table "bebes", :force => true do |t|
    t.integer "dossier_id"
    t.boolean "malformation"
    t.boolean "pathologie"
    t.integer "sexe"
    t.string  "poids"
    t.string  "apgar1"
    t.string  "apgar5"
    t.string  "pc"
    t.string  "taille"
    t.integer "malforme",     :default => 0
  end

  add_index "bebes", ["dossier_id"], :name => "index_bebes_on_dossier_id"

  create_table "cats", :force => true do |t|
    t.string  "name"
    t.integer "dossiers_count"
  end

  create_table "correspondants", :force => true do |t|
    t.integer "specialite_id"
    t.integer "qualite_id"
    t.integer "formule_id"
    t.string  "name"
    t.text    "adresse"
    t.integer "cp"
    t.string  "ville"
    t.integer "tel"
    t.integer "fax"
    t.integer "poste"
    t.string  "email"
    t.integer "sexe"
  end

  create_table "demandeurs", :force => true do |t|
    t.string "name"
  end

  create_table "dossiers", :force => true do |t|
    t.string   "n_sicap"
    t.integer  "acctype_id"
    t.integer  "correspondant_id"
    t.integer  "profession_id"
    t.integer  "ncode"
    t.date     "date_appel"
    t.date     "ddr"
    t.date     "dra"
    t.date     "dap"
    t.date     "dg"
    t.string   "nom",              :limit => 30
    t.string   "prenom",           :limit => 30
    t.integer  "age"
    t.integer  "ap"
    t.integer  "af"
    t.integer  "assmedproc"
    t.integer  "fcs",                            :default => 0
    t.integer  "geu",                            :default => 0
    t.integer  "miu",                            :default => 0
    t.integer  "ivg",                            :default => 0
    t.integer  "img",                            :default => 0
    t.integer  "nai",                            :default => 0
    t.integer  "terme"
    t.integer  "accmod_id"
    t.integer  "path_mat"
    t.integer  "tabac"
    t.integer  "alcool"
    t.integer  "sa"
    t.text     "comm_ap"
    t.text     "comm_af"
    t.text     "comm_expo"
    t.text     "comm_evol"
    t.text     "comm_bebe"
    t.text     "commentaire"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "niveau_id"
    t.integer  "cat_id"
    t.integer  "demandeur_id"
    t.integer  "bebes_count",                    :default => 0
    t.string   "expo_type"
    t.integer  "gestite"
    t.boolean  "terato",                         :default => false
    t.date     "date_naissance"
    t.boolean  "anomalie_echo"
    t.boolean  "rciu"
  end

  add_index "dossiers", ["accmod_id"], :name => "index_dossiers_on_accmod_id"
  add_index "dossiers", ["acctype_id"], :name => "index_dossiers_on_acctype_id"
  add_index "dossiers", ["cat_id"], :name => "index_dossiers_on_cat_id"
  add_index "dossiers", ["correspondant_id"], :name => "index_dossiers_on_correspondant_id"
  add_index "dossiers", ["demandeur_id"], :name => "index_dossiers_on_demandeur_id"
  add_index "dossiers", ["niveau_id"], :name => "index_dossiers_on_niveau_id"
  add_index "dossiers", ["profession_id"], :name => "index_dossiers_on_profession_id"

  create_table "expositions", :force => true do |t|
    t.integer "dossier_id"
    t.integer "produit_id"
    t.integer "terme_id"
    t.integer "niveau_id"
  end

  add_index "expositions", ["dossier_id"], :name => "index_expositions_on_dossier_id"

  create_table "malformation_assignments", :force => true do |t|
    t.integer  "bebe_id"
    t.integer  "malformation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "malformations", :force => true do |t|
    t.string   "libabr"
    t.integer  "level"
    t.string   "libelle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.integer  "parent_id"
  end

  add_index "malformations", ["ancestry"], :name => "index_malformations_on_ancestry"

  create_table "niveaux", :force => true do |t|
    t.string  "name"
    t.integer "dossiers_count"
  end

  create_table "pathologie_assignments", :force => true do |t|
    t.integer  "bebe_id"
    t.integer  "pathologie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pathologies", :force => true do |t|
    t.string   "libabr"
    t.integer  "level"
    t.string   "libelle"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "pathologies", ["ancestry"], :name => "index_pathologies_on_ancestry"

  create_table "produits", :force => true do |t|
    t.string "name"
  end

  create_table "professions", :force => true do |t|
    t.string "name"
  end

  create_table "qualites", :force => true do |t|
    t.string "name"
  end

  create_table "specialites", :force => true do |t|
    t.string "name"
  end

end
