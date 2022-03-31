const KennelCard = {
  props: {
    dog: { type: Object, required: true }
  },
  template: `
    <div class="kennel_card">
      <div class="kennel_card_header">
        {{ dog.name }}
      </div>
      <div class="kennel_card_body">
        <div class="kennel_card_body_info">
          <div class="kennel_card_body_info_title">Gender:</div>
          <div class="kennel_card_body_info_data">{{ dog.gender }}</div>
        </div>
        <div class="kennel_card_body_info">
          <div class="kennel_card_body_info_title">Color:</div>
          <div class="kennel_card_body_info_data">{{ dog.color }}</div>
      </div>
      <div class="kennel_card_body_info">
        <div class="kennel_card_body_info_title">Recruited:</div>
        <div class="kennel_card_body_info_data">{{ dog.recruited }}</div>
      </div>
      </div>
      <div class="kennel_card_footer">
        <slot name="footer" />
      </div>
    </div>
  `
}