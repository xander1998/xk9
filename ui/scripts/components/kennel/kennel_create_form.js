const KennelCreateForm = {
  data() {
    return {
      selectedName: "",
      selectedGender: "",
      items: ["Male", "Female"]
    }
  },
  methods: {
    CloseCreator() {
      this.$emit("close");
    }
  },
  template: `
    <div class="kennel_create_form">
      <div class="kennel_create_form_header">
        KENNEL CREATOR
        <div class="kennel_create_form_header_close" @click="CloseCreator">X</div>
      </div>
      <div class="kennel_create_form_body">
        <kennel-create-input v-model="selectedName" label="Name" placeholder="K9's Name" />
        <hr style="width: 310px;" />
        <kennel-create-dropdown label="Genders" :items="items" />
        <kennel-create-dropdown label="Genders" :items="items" />
      </div>
    </div>
  `,
  components: { KennelCreateInput, KennelCreateDropdown }
}