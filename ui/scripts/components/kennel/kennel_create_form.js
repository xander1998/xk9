const KennelCreateForm = {
  data() {
    return {
      items: ["Male", "Female"]
    }
  },
  template: `
    <div class="kennel_create_form">
      <div class="kennel_create_form_header">
        KENNEL CREATOR
        <div class="kennel_create_form_header_close">X</div>
      </div>
      <div class="kennel_create_form_body">
        <kennel-create-input label="Name" placeholder="K9's Name" />
        <hr style="width: 310px;" />
        <kennel-create-dropdown label="Genders" :items="items" />
        <kennel-create-dropdown label="Genders" :items="items" />
      </div>
    </div>
  `,
  components: { KennelCreateInput, KennelCreateDropdown }
}