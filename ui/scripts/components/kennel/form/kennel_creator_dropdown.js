const KennelCreatorDropdown = {
  props: {
    label: { type: String, required: false, default: "Default Dropdown" },
    items: { type: Array, required: false, default: [] }
  },
  data() {
    return {
      isOpen: false,
      selectedItem: null
    }
  },
  methods: {
    ToggleDropdown() {
      this.isOpen = !this.isOpen;
    },
    SelectItem(itemIndex) {
      this.selectedItem = this.items[itemIndex];
      this.$emit("itemSelected", this.selectedItem);
    }
  },
  template: `
    <div class="kennel_creator_dropdown">
      <div class="kennel_creator_dropdown_label">{{ label }}</div>
      <div :class="{ 'kennel_creator_dropdown_button': true, 'kennel_creator_dropdown_button_active': isOpen }" @click="ToggleDropdown">
        <image :class="{ 'kennel_creator_dropdown_button_image': !isOpen, 'kennel_creator_dropdown_button_image_active': isOpen }" />
      </div>
      <div class="kennel_creator_dropdown_items" v-show="isOpen">
        <div
          :class="{ 'kennel_creator_dropdown_item': true, 'kennel_creator_dropdown_item_active': selectedItem == itemIndex }"
          v-for="(item, itemIndex) in items"
          @click="SelectItem(itemIndex)">
            {{ item }}
        </div>
      </div>
    </div>
  `
}