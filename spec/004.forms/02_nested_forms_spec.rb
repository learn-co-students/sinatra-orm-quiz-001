feature "nested forms" do
  context "hashes" do
    describe "table attributes" do
      it "should have 'name', 'wood', and 'price' keys under the 'table' key" do
        name = "Kitchen Table"
        wood = "Maple"
        price = 1200

        visit "/table"

        fill_in "name", with: name
        fill_in "wood", with: wood
        fill_in "price", with: price

        click_button "Save"

        expect(page).to have_content name.upcase
        expect(page).to have_content wood.upcase
        expect(page).to have_content price
      end
    end
  end

  context "arrays" do
    describe "lamp colors" do
      it "should have 4 colors under the 'lamp' key (use IDs to help identify the fields)" do
        colors = ['red', 'green', 'blue', 'yellow']

        visit "/lamp"

        4.times do |n|
          fill_in "color_#{n}", with: colors[n]
        end

        click_button "Save"

        expect(page).to have_content colors.join(',')
      end
    end
  end
end
