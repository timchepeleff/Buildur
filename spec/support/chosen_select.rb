module ChosenSelect
  def select_from_chosen(item_text, options)
  field_id = find_field(options[:from])[:id]
  within "##{field_id}_chzn" do
    input = find("ul.chzn-choices input")
    item_text.each_char do |char|
      input.base.invoke('keypress', false, false, false, false, char.ord, nil);
    end
    input.base.invoke('keypress', false, false, false, false, 13, nil); # return
    within 'ul.chzn-choices' do
      page.should have_content item_text
    end
  end
end
end
