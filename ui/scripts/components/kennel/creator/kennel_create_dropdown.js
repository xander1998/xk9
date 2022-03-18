const KennelCreateDropdown = {
  props: {
    label: { type: String, required: true },
    items: { type: Array, required: true, default: [] }
  },
  template: `
    <div class="kennel_create_dropdown">
      <div class="kennel_create_dropdown_label">{{ label }}</div>
      <div class="kennel_create_dropdown_button">
        <div class="kennel_create_dropdown_option">Options</div>
        <div class="kennel_create_dropdown_list">
          <div class="kennel_create_dropdown_item" v-for="(item, itemIndex) in items">{{ item }}</div>
        </div>
      </div>
    </div>
  `
}