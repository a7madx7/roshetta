class AddBioavailabilityProfilesToGenerics < ActiveRecord::Migration[5.1]
  def change
    add_column :generics, :oral_bioavailability, :decimal
    add_column :generics, :iv_bioavailability, :decimal, default: 100.0
    add_column :generics, :sc_bioavailability, :decimal, default: 0.0
    add_column :generics, :rectal_bioavailability, :decimal, default: 0.0
    add_column :generics, :half_life_in_hours, :decimal, default: 0.0
    add_column :generics, :protein_binding, :decimal, default: 0.0
    add_column :generics, :excretion, :string, default: 'Hepatic'
    add_column :generics, :metabolism, :string, default: 'Hepatic microsomal enzymes'
    add_column :generics, :metabolism_specific, :string, default: 'Cytochrome P450'
  end
end
