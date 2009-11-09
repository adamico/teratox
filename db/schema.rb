# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091109102236) do

  create_table "accmods", :force => true do |t|
    t.string "abbr"
    t.string "name"
  end

  create_table "acctypes", :force => true do |t|
    t.string "abbr"
    t.string "name"
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
  end

  create_table "correspondants", :force => true do |t|
    t.integer "specialite_id"
    t.integer "qualite_id"
    t.integer "formule_id"
    t.string  "nom"
    t.text    "adresse"
    t.integer "cp"
    t.string  "ville"
    t.integer "tel"
    t.integer "fax"
    t.integer "poste"
    t.string  "email"
  end

  create_table "dossiers", :force => true do |t|
    t.string   "n_sicap"
    t.integer  "acctype_id"
    t.integer  "correspondant_id"
    t.integer  "profession_id"
    t.integer  "ncode"
    t.datetime "date_appel"
    t.datetime "ddr"
    t.datetime "dra"
    t.datetime "dap"
    t.datetime "dg"
    t.string   "nom",              :limit => 30
    t.string   "prenom",           :limit => 30
    t.integer  "age"
    t.integer  "ap_id"
    t.integer  "af_id"
    t.integer  "assmedproc_id"
    t.integer  "fcs"
    t.integer  "geu"
    t.integer  "miu"
    t.integer  "ivg"
    t.integer  "img"
    t.integer  "nai"
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
  end

  create_table "expositions", :force => true do |t|
    t.integer "dossier_id"
    t.integer "produit_id"
    t.integer "terme_id"
    t.integer "niveau_id"
  end

  create_table "niveaux", :force => true do |t|
    t.string "name"
  end

  create_table "produits", :force => true do |t|
    t.string "name"
  end

  create_table "professions", :force => true do |t|
    t.string "name"
  end

end
