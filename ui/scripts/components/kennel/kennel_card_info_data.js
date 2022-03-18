const KennelCardInfoData = {
  props: ["name", "result"],
  template: `
    <div class="kennel_card_info_data">
      <div class="kennel_card_info_data_name">{{ name }}:</div>
      <div class="kennel_card_info_data_result">{{ result }}</div>
    </div>
  `
}