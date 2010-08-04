class CreateDossiers < ActiveRecord::Migration
  def self.up
    create_table :dossiers do |t|
      t.string  :n_sicap
      t.references  :acctype
      t.references  :correspondant
      t.references  :profession
      t.integer :ncode
      t.date  :date_appel, :ddr, :dra, :dap, :dg
      t.string  :nom, :limit => 30
      t.string  :prenom,  :limit => 30
      t.integer :age
      t.integer :ap, :af, :assmedproc #antécédents, assistance médicale à la procréation
      t.integer :fcs, :geu, :miu, :ivg, :img, :nai, :parite
      t.integer :terme
      t.references :accmod #table à reexporter?
      t.integer :path_mat #mode d'accouchement, pathologie maternelle
      t.integer :tabac, :alcool #0-4
      t.integer :sa #semaines d'amenorrhée
      t.text  :comm_ap, :comm_af, :comm_expo,
              :comm_evol, :comm_bebe, :commentaire # commentaires atcds, général

      t.timestamps
    end
  end

  def self.down
    drop_table :dossiers
  end
end
