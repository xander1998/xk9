const KennelCreateForm = {
  data() {
    return {
      selectedName: "",
      selectedGender: "",
      genderList: ["Male", "Female"]
    }
  },
  methods: {
    CloseCreator() {
      this.$emit("close");
    },
    UpdateName(name) {
      this.selectedName = name;
    },
    SelectGender(gender) {
      this.selectedGender = gender;
    }
  },
  template: `
    <div class="kennel_create_form">
      <div class="kennel_create_form_header">
        KENNEL CREATOR
        <div class="kennel_create_form_header_close" @click="CloseCreator">X</div>
      </div>
      <div class="kennel_create_form_body">
        <kennel-create-input @updateName="UpdateName" label="Name" placeholder="K9's Name" />
        <hr style="width: 310px;" />
        <kennel-create-dropdown @genderSelected="SelectGender" label="Genders" :items="genderList" />
        <hr style="width: 310px;" />
        <kennel-create-dropdown @genderSelected="SelectGender" label="Genders" :items="genderList" />
      </div>
    </div>
  `,
  components: { KennelCreateInput, KennelCreateDropdown }
}