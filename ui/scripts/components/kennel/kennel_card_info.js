const KennelCardInfo = {
  props: {
    title: { type: String, required: true },
    data: { type: Object, required: false }
  },
  template: `
    <div class="kennel_card_info">
      <div class="kennel_card_info_header">{{ title }}</div>
      <div class="kennel_card_info_body">
        <slot />
      </div>
    </div>
  `
}