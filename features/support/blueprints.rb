require 'machinist/active_record'
require 'sham'
require 'faker'

Dossier.blueprint do
  n_sicap { |index| "LP#{index}" }
  nom     { Faker::Name.name }
  age     { (1..50).to_a.rand }
  nai     { (0..5).to_a.rand }
  fcs     { (0..5).to_a.rand }
  geu     { (0..5).to_a.rand }
  miu     { (0..5).to_a.rand }
  img     { (0..5).to_a.rand }
  ivg     { (0..5).to_a.rand }
  sa      { (3..40).to_a.rand }
  tabac '0'
  alcool '0'
  ncode '0'
  date_appel "2001-01-01 00-00-00"
  ddr '2001-01-01 00-00-00'
  dra '2001-01-01 00-00-00'
  dap '2001-01-01 00-00-00'
  dg '2001-01-01 00-00-00'
  terme { (30..40).to_a.rand }
  path_mat '0'
  comm_ap 'blabla'
  comm_af 'blabla'
  comm_expo 'blabla'
  comm_evol 'blabla'
  comm_bebe 'blabla'
  ap_id '0'
  af_id '0'
  assmedproc_id '0'
  #associations
  niveau { Niveau.make }
  acctype { Acctype.make }
end

Niveau.blueprint do
  name 'Infime'
end

Acctype.blueprint do
  abbr 'NAI'
  name 'naissance'
end
