Factory.define :dossier do |d|
  d.sequence(:n_sicap) { |n| "LP#{n}" }
  d.nom 'Martin'
  d.prenom 'Martine'
  d.age '27'
  d.nai '1'
  d.fcs '0'
  d.geu '0'
  d.sa '12'
  d.miu '0'
  d.img '0'
  d.ivg '0'
  d.tabac '0'
  d.alcool '0'
  d.ncode '0'
  d.date_appel '2001-01-01 00-00-00'
  d.ddr '2001-01-01 00-00-00'
  d.dra '2001-01-01 00-00-00'
  d.dap '2001-01-01 00-00-00'
  d.dg '2001-01-01 00-00-00'
  d.terme '40'
  d.path_mat '0'
  d.comm_ap 'blabla'
  d.comm_af 'blabla'
  d.comm_expo 'blabla'
  d.comm_evol 'blabla'
  d.comm_bebe 'blabla'
  d.ap_id '0'
  d.af_id '0'
  d.assmedproc_id '0'
  #d.commmentaire 'blabla'
  # associations
  d.niveau {|n| n.association(:niveau)}
  d.acctype {|a| a.association(:acctype)}
  d.profession {|p| p.association(:profession)}
  d.accmod {|am| am.association(:accmod)}
end
