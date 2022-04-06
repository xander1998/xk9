const KennelCreatorDropdown = {
  props: {
    label: { type: String, required: false, default: "Default Dropdown" },
    items: { type: Array, required: false, default: [] }
  },
  data() {
    return {
      isOpen: false
    }
  },
  methods: {
    ToggleDropdown() {
      this.isOpen = !this.isOpen;
    }
  },
  template: `
    <div :class="{ 'kennel_creator_dropdown': true, 'kennel_creator_dropdown_active': isOpen }">
      <div class="kennel_creator_dropdown_label">{{ label }}</div>
      <div :class="{ 'kennel_creator_dropdown_button': true, 'kennel_creator_dropdown_button_active': isOpen }" @click="ToggleDropdown">*</div>
      <div class="kennel_creator_dropdown_items" v-show="isOpen">
        <div class="kennel_creator_dropdown_item" v-for="(item, itemIndex) in 5">Test_Item {{ itemIndex }}</div>
      </div>
    </div>
  `
}