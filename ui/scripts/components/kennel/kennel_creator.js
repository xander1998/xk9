const KennelCreator = {
  data() {
    return {
      name: "Default Name",
      isMale: false,
      dogColor: null,
      dogVestType: null,
      dogVestColor: null,
      dogColors: [],
      dogVestColors: [],
      dogVestTypes: []
    }
  },
  methods: {
    setCreatorConfig(data) {
      this.dogColors = data.dogColors;
      this.dogVestColors = data.vestColors;
      this.dogVestTypes = data.vestTypes;
    },
    isMaleChanged(value) {
      this.isMale = value;
    },
    nameChanged(value) {
      this.name = value;
    },
    dogColorChanged(value) {
      this.dogColor = value;
    },
    dogVestTypeChanged(value) {
      this.dogVestType = value;
    },
    dogVestColorChanged(value) {
      this.dogVestColor = value;
    },
    closeCreator() {
      this.$emit("close");
    },
    validateForm() {
      const nameValid = new RegExp("^[a-zA-Z]+$").test(this.name);
      const dogColorValid = this.dogColor ? true : false;
      const dogVestColorValid = this.dogVestColor ? true : false;
      const dogVestTypeValid = this.dogVestType ? true : false;
      if (nameValid && dogColorValid && dogVestColorValid && dogVestTypeValid) { return true; }
      return false;
    },
    formSubmit() {
      if (this.validateForm()) {
        axios.post(`https://${GetParentResourceName()}/createK9`, {
          name: this.name,
          male: this.isMale,
          dogColor: this.dogColor,
          vestType: this.dogVestType,
          vestColor: this.dogVestColor
        })
        this.closeCreator();
      }
    }
  },
  mounted() {
    axios.post(`https://${GetParentResourceName()}/requestCreatorConfig`).then((results) => {
      this.setCreatorConfig(results.data);
    })
  },
  template: `
    <div class="kennel_creator">
      <div class="kennel_creator_header">
        K9 CREATOR
        <div class="kennel_container_close" @click="closeCreator">
          <image />
        </div>
      </div>
      <div class="kennel_creator_body">
        <kennel-creator-input label="Name" @changed="nameChanged" />
        <kennel-creator-checkbox label="Is this a male K9?" @changed="isMaleChanged" />
        <kennel-creator-dropdown label="K9 Colors" :items="dogColors" @itemSelected="dogColorChanged" />
        <kennel-creator-dropdown label="K9 Vest Colors" :items="dogVestColors" @itemSelected="dogVestColorChanged" />
        <kennel-creator-dropdown label="K9 Vest Type" :items="dogVestTypes" @itemSelected="dogVestTypeChanged" />
        <div class="kennel_creator_create_button" @click="formSubmit">CREATE</div>
      </div>
    </div>
  `,
  components: { KennelCreatorCheckbox, KennelCreatorInput, KennelCreatorDropdown }
}