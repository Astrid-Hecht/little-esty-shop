require 'rails_helper'

RSpec.describe Merchant, type: :model do  
  describe 'relationships' do
    it { should have_many :items }
    it { should have_many :bulk_discounts}
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  let!(:carly_silo) { Merchant.create!(name: "Carly Simon's Candy Silo")}
  let!(:jewlery_city) { Merchant.create!(name: "Jewlery City Merchant")}
  let!(:doghats) { Merchant.create!(name: "Hats for Dogs", enabled: true) }
  let!(:hummus_sculpt) { Merchant.create!(name: "Hummus Sculptures", enabled: true) }
  let!(:bmv) { Merchant.create!(name: "Bavarian Motor Velocycles")}
  let!(:tersela) { Merchant.create!(name: "Tersela")}

  let!(:licorice) { carly_silo.items.create!(name: "Licorice Funnels", description: "Licorice Balls", unit_price: 1200, enabled: true) }
  let!(:peanut) { carly_silo.items.create!(name: "Peanut Bronzinos", description: "Peanut Caramel Chews", unit_price: 1500, enabled: true) }
  let!(:choco_waffle) { carly_silo.items.create!(name: "Chocolate Waffles Florentine", description: "Cholately Waffles of Deliciousness", unit_price: 900, enabled: false) }
  let!(:hummus) { carly_silo.items.create!(name: "Hummus", description: "Creamy Hummus", unit_price: 1200, enabled: false) }

  let!(:gold_earrings) { jewlery_city.items.create!(name: "Gold Earrings", description: "14k Gold 12' Hoops", unit_price: 12000) }
  let!(:silver_necklace) { jewlery_city.items.create!(name: "Silver Necklace", description: "An everyday wearable silver necklace", unit_price: 220000) }
  let!(:studded_bracelet) { jewlery_city.items.create!(name: "Gold Studded Bracelet", description: "A bracet to make others jealous", unit_price: 2900) }
  let!(:dainty_anklet) { jewlery_city.items.create!(name: "Dainty Ankley", description: "An everyday ankley", unit_price: 2299) }
  let!(:stackable_rings) { jewlery_city.items.create!(name: "Stackable Gold Rings", description: "Small rings to be mixed and matched", unit_price: 1299) }
  let!(:conch_shell) { jewlery_city.items.create!(name: "Conch Shell Headdress", description: "A beach-ready, waterproof shell hat", unit_price: 5099) }
  let!(:banana_earrings) { jewlery_city.items.create!(name: "Banana Earrings", description: "A fruit salad for your earlobes", unit_price: 2399) }
  let!(:nose_ring) { jewlery_city.items.create!(name: "Platinum Nose Ring", description: "They'll never know it's platinum!", unit_price: 4299) }
  let!(:spiked_wallet_chain) { jewlery_city.items.create!(name: "Spiked Wallet Chain", description: "Keep it close, keep it safe", unit_price: 1599) }

  let!(:boxer) { doghats.items.create!(name: "Boxer Bowler", description: "Now with convienent earholes", unit_price: 16000, enabled: true) }
  
  let!(:trombone) { hummus_sculpt.items.create!(name: "Tahini Trombone", description: "Dont buy this", unit_price: 5000, enabled: true) }
  let!(:pita) { hummus_sculpt.items.create!(name: "Picked Pita", description: "Yummy", unit_price: 700, enabled: true) }
  
  let!(:skooter) { bmv.items.create!(name: "Hollenskooter", description: "Some stuff", unit_price: 12000, enabled: true) }
  let!(:rider) { bmv.items.create!(name: "Hosenpfloofer", description: "Some stuff", unit_price: 220000, enabled: true) }
  
  let!(:cyber_bus) { tersela.items.create!(name: "Cyberbus", description: "It may be electric, but it still only holds one person!", unit_price: 8900000, enabled: true) }

  let!(:alaina) { Customer.create!(first_name: "Alaina", last_name: "Kneiling")}
  let!(:whitney) { Customer.create!(first_name: "Whitney", last_name: "Gains")}
  let!(:sydney) { Customer.create!(first_name: "Sydney", last_name: "Lang")}
  let!(:eddie) { Customer.create!(first_name: "Eddie", last_name: "Young")}
  let!(:ryan) { Customer.create!(first_name: "Ryan", last_name: "Vergeront")}
  let!(:leah) { Customer.create!(first_name: "Leah", last_name: "Anderson")}
  let!(:polina) { Customer.create!(first_name: "Polina", last_name: "Eisenberg")}

  let!(:whitney_invoice1) { whitney.invoices.create!(status: "completed", created_at: "2012-01-30 14:54:09" )}
  let!(:whitney_invoice2) { whitney.invoices.create!(status: "completed")}
  let!(:whitney_invoice3) { whitney.invoices.create!(status: "completed")}
  let!(:whitney_invoice4) { whitney.invoices.create!(status: "completed")}
  let!(:whitney_invoice5) { whitney.invoices.create!(status: "completed")}
  let!(:whitney_invoice6) { whitney.invoices.create!(status: "completed")}
  let!(:alaina_invoice1) { alaina.invoices.create!(status: "completed", created_at: "2020-01-30 14:54:09")}
  let!(:alaina_invoice2) { alaina.invoices.create!(status: "in_progress", created_at: "2020-05-25 14:54:09")}
  let!(:alaina_invoice3) { alaina.invoices.create!(status: "completed", created_at: "2020-05-25 14:54:09")}
  let!(:alaina_invoice4) { alaina.invoices.create!(status: "completed", created_at: "2020-08-15 14:54:09")}
  let!(:alaina_invoice5) { alaina.invoices.create!(status: "completed", created_at: "2020-05-25 14:54:09")}
  let!(:alaina_invoice6) { alaina.invoices.create!(status: "completed", created_at: "2020-05-25 14:54:09")}
  let!(:alaina_invoice7) { alaina.invoices.create!(status: "completed")}
  let!(:alaina_invoice8) { alaina.invoices.create!(status: "completed")}
  let!(:alaina_invoice9) { alaina.invoices.create!(status: "completed")}
  let!(:eddie_invoice1) { eddie.invoices.create!(status: "completed", created_at: "2000-01-30 14:54:09")}
  let!(:eddie_invoice2) { eddie.invoices.create!(status: "completed")}
  let!(:eddie_invoice3) { eddie.invoices.create!(status: "completed")}
  let!(:ryan_invoice1) { ryan.invoices.create!(status: "completed")}
  let!(:ryan_invoice2) { ryan.invoices.create!(status: "completed")}
  let!(:polina_invoice1) { polina.invoices.create!(status: "completed")}
  let!(:polina_invoice2) { polina.invoices.create!(status: "cancelled")}
  let!(:leah_invoice1) { leah.invoices.create!(status: "cancelled")}
  let!(:leah_invoice2) { leah.invoices.create!(status: "in_progress")}

  let!(:whitney_invoice1_transaction) { whitney_invoice1.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:whitney_invoice2_transaction) { whitney_invoice2.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:whitney_invoice3_transaction) { whitney_invoice3.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:whitney_invoice4_transaction) { whitney_invoice4.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:whitney_invoice5_transaction) { whitney_invoice5.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:whitney_invoice6_transaction) { whitney_invoice6.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:alaina_invoice1_transaction) { alaina_invoice1.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:alaina_invoice2_transaction) { alaina_invoice2.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:alaina_invoice3_transaction) { alaina_invoice3.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:alaina_invoice4_transaction) { alaina_invoice4.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:alaina_invoice5_transaction) { alaina_invoice5.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:alaina_invoice6_transaction) { alaina_invoice6.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:alaina_invoice7_transaction) { alaina_invoice7.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:alaina_invoice8_transaction) { alaina_invoice8.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:alaina_invoice9_transaction) { alaina_invoice9.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:eddie_invoice1_transaction) { eddie_invoice1.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:eddie_invoice2_transaction) { eddie_invoice2.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:eddie_invoice3_transaction) { eddie_invoice3.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:polina_invoice1_transaction) { polina_invoice1.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:polina_invoice2_transaction) { polina_invoice2.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:ryan_invoice1_transaction) { ryan_invoice1.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "success")}
  let!(:ryan_invoice2_transaction) { ryan_invoice2.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "failed")}
  let!(:leah_invoice1_transaction) { leah_invoice1.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "failed")}
  let!(:leah_invoice2_transaction) { leah_invoice1.transactions.create!(credit_card_number: "4654405418249632", credit_card_expiration_date: nil, result: "failed")}

  let!(:alainainvoice1_itemgold_earrings) { InvoiceItem.create!(invoice_id: alaina_invoice1.id, item_id: gold_earrings.id, quantity: 4, unit_price: 1300, status:"packaged" )}
  let!(:alainainvoice2_itemgold_earrings) { InvoiceItem.create!(invoice_id: alaina_invoice2.id, item_id: gold_earrings.id, quantity: 40, unit_price: 1500, status:"shipped" )}
  let!(:alainainvoice3_itemgold_earrings) { InvoiceItem.create!(invoice_id: alaina_invoice3.id, item_id: gold_earrings.id, quantity: 12, unit_price: 1600, status:"shipped" )}
  let!(:alainainvoice4_itemgold_earrings) { InvoiceItem.create!(invoice_id: alaina_invoice4.id, item_id: gold_earrings.id, quantity: 4, unit_price: 2400, status:"shipped" )}
  let!(:alainainvoice5_itemgold_earrings) { InvoiceItem.create!(invoice_id: alaina_invoice5.id, item_id: gold_earrings.id, quantity: 243, unit_price: 27000, status:"shipped" )}
  let!(:alainainvoice6_itemgold_earrings) { InvoiceItem.create!(invoice_id: alaina_invoice6.id, item_id: conch_shell.id, quantity: 1412, unit_price: 12421, status:"shipped" )}
  let!(:alainainvoice7_itemgold_earrings) { InvoiceItem.create!(invoice_id: alaina_invoice7.id, item_id: banana_earrings.id, quantity: 122, unit_price: 1242, status:"shipped" )}
  let!(:alainainvoice8_itemgold_earrings) { InvoiceItem.create!(invoice_id: alaina_invoice8.id, item_id: nose_ring.id, quantity: 2881, unit_price: 4599, status:"shipped" )}
  let!(:alainainvoice5_itemgold_earrings) { InvoiceItem.create!(invoice_id: alaina_invoice9.id, item_id: spiked_wallet_chain.id, quantity: 827, unit_price: 3499, status:"shipped" )}

  let!(:alainainvoice1_itempeanut) { InvoiceItem.create!(invoice_id: alaina_invoice1.id, item_id: peanut.id, quantity: 1, unit_price: 1500, status:"packaged" )}
  let!(:alainainvoice1_itemboxer) { InvoiceItem.create!(invoice_id: alaina_invoice1.id, item_id: boxer.id, quantity: 4, unit_price: 16000, status:"packaged" )}
  let!(:alainainvoice1_itemtrombone) { InvoiceItem.create!(invoice_id: alaina_invoice1.id, item_id: trombone.id, quantity: 4, unit_price: 5000, status:"packaged" )}
  let!(:alainainvoice1_itempita) { InvoiceItem.create!(invoice_id: alaina_invoice1.id, item_id: pita.id, quantity: 4, unit_price: 700, status:"packaged" )}
  let!(:alainainvoice1_itemskooter) { InvoiceItem.create!(invoice_id: alaina_invoice1.id, item_id: skooter.id, quantity: 4, unit_price: 12000, status:"packaged" )}
  let!(:alainainvoice1_itemrider) { InvoiceItem.create!(invoice_id: alaina_invoice1.id, item_id: rider.id, quantity: 4, unit_price: 220000, status:"packaged" )}
  
  let!(:whitneyinvoice1_itemsilver_necklace) { InvoiceItem.create!(invoice_id: whitney_invoice1.id, item_id: silver_necklace.id, quantity: 3, unit_price: 270, status:"packaged" )}
  let!(:whitneyinvoice2_itemsilver_necklace) { InvoiceItem.create!(invoice_id: whitney_invoice2.id, item_id: silver_necklace.id, quantity: 31, unit_price: 270, status:"shipped" )}
  let!(:whitneyinvoice3_itemsilver_necklace) { InvoiceItem.create!(invoice_id: whitney_invoice3.id, item_id: silver_necklace.id, quantity: 1, unit_price: 270, status:"shipped" )}
  let!(:whitneyinvoice4_itemsilver_necklace) { InvoiceItem.create!(invoice_id: whitney_invoice4.id, item_id: silver_necklace.id, quantity: 10, unit_price: 270, status:"shipped" )}
  let!(:whitneyinvoice5_itemsilver_necklace) { InvoiceItem.create!(invoice_id: whitney_invoice5.id, item_id: silver_necklace.id, quantity: 1, unit_price: 270, status:"shipped" )}
  let!(:whitneyinvoice6_itemsilver_necklace) { InvoiceItem.create!(invoice_id: whitney_invoice6.id, item_id: silver_necklace.id, quantity: 3, unit_price: 270, status:"shipped" )}


  let!(:eddie_invoice1_itemstudded_bracelet) { InvoiceItem.create!(invoice_id: eddie_invoice1.id, item_id: studded_bracelet.id, quantity: 3, unit_price: 2199, status:"pending" )}
  let!(:eddie_invoice2_itemstudded_bracelet) { InvoiceItem.create!(invoice_id: eddie_invoice2.id, item_id: studded_bracelet.id, quantity: 3, unit_price: 2700, status:"shipped" )}
  let!(:eddie_invoice3_itemstudded_bracelet) { InvoiceItem.create!(invoice_id: eddie_invoice3.id, item_id: studded_bracelet.id, quantity: 3, unit_price: 10299, status:"shipped" )}

  let!(:polina_invoice1_itemstudded_bracelet) { InvoiceItem.create!(invoice_id: polina_invoice1.id, item_id: dainty_anklet.id, quantity: 6, unit_price: 270, status:"shipped" )}
  let!(:polina_invoice2_itemstudded_bracelet) { InvoiceItem.create!(invoice_id: polina_invoice2.id, item_id: dainty_anklet.id, quantity: 1, unit_price: 270, status:"shipped" )}

  describe 'class methods' do
    describe '#enabled_merchants' do
      it 'returns a list of enabled merchants' do
        expect(Merchant.enabled_merchants).to eq([doghats, hummus_sculpt])
      end
    end

    describe '#disabled_merchants' do
      it 'returns a list of disabled merchants' do
        expect(Merchant.disabled_merchants).to eq([carly_silo, jewlery_city, bmv, tersela])
      end
    end  
    
    describe '#merchants_top_5' do
      it 'returns a list of 5 merchants with the top total revenue ordered descending' do
        expect(Merchant.merchants_top_5).to eq([jewlery_city, bmv, doghats, hummus_sculpt, carly_silo])
      end

      it 'calculates each top merchants total revenue' do
        expected_revs = [33988082, 928000, 64000, 22800, 1500]
        Merchant.merchants_top_5.each_with_index do |merchant, index|
          expect(merchant.revenue).to eq(expected_revs[index])
        end
      end
    end


  end
  
  describe 'instance methods' do
    describe '#enabled_items' do
      it 'returns an array of enabled items' do
        expect(carly_silo.enabled_items).to eq([licorice, peanut])
      end
    end

    describe '#disabled_items' do
      it 'returns an array of enabled items' do
        expect(carly_silo.disabled_items).to eq([choco_waffle, hummus])
      end
    end

    describe '#transactions_top_5' do
      it 'finds the top 5 customers with the most successful transactions with a particular merchant' do

        expect(jewlery_city.transactions_top_5.pluck(:first_name)).to eq(["Alaina", "Whitney", "Eddie", "Polina", "Ryan"])
      end
    end

    describe '#ready_to_ship_items_ordered' do
      it 'finds all items that are ready to ship for a particular merchant' do
        expect(jewlery_city.ready_to_ship_items_ordered.pluck(:name)).to eq(["Gold Studded Bracelet", "Silver Necklace", "Gold Earrings"])
        expect(jewlery_city.ready_to_ship_items_ordered.pluck("invoices.id") ).to eq([eddie_invoice1.id, whitney_invoice1.id, alaina_invoice1.id])
        expect(jewlery_city.ready_to_ship_items_ordered.pluck("invoices.created_at")).to eq(["2000-01-30 14:54:09.000000000 +0000", "2012-01-30 14:54:09.000000000 +0000","2020-01-30 14:54:09.000000000 +0000"])
      end
    end

    describe '#top_5_items' do
      it 'an array of the top 5 items by revenue' do
        expect(jewlery_city.top_5_items).to eq([conch_shell, nose_ring, spiked_wallet_chain, banana_earrings, gold_earrings])
      end
    end

    describe '#best_sales_date' do
      it 'returns the date where given merchant had most sales' do
        expect(jewlery_city.best_sales_date).to eq("May 25, 2020")
      end
    end
  end
end