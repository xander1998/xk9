const KennelCreateDropdown = {
  props: {
    label: { type: String, required: true },
    items: { type: Array, required: true, default: [] }
  },
  data() {
    return {
      selectedGender: null
    }
  },
  methods: {
    SelectItem(itemIndex) {
      this.$emit("input", this.items[itemIndex]);
      this.selectedGender = this.items[itemIndex];
    }
  },
  template: `
    <div class="kennel_create_dropdown">
      <div class="kennel_create_dropdown_label">{{ label }}</div>
      <div class="kennel_create_dropdown_button">
        <div class="kennel_create_dropdown_option">{{ selectedGender || "Options" }}</div>
        <div class="kennel_create_dropdown_list">
          <div class="kennel_create_dropdown_item" v-for="(item, itemIndex) in items" @click="SelectItem(itemIndex)">{{ item }}</div>
        </div>
      </div>
    </div>
  `
}