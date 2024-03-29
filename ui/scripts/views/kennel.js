const Kennel = {
  data() {
    return {
      dogs: [],
      showCreator: false,
      page: 1,
      dogPerPage: 4,
      showDogSkills: false,
      showSkillsCover: false,
      selectedDog: null
    }
  },
  methods: {
    EVENT_UpdateK9List(data) {
      console.log(JSON.stringify(data.dogs, null, 4));
      this.dogs = data.dogs;
    },
    DisplayCard(index) {
      const startIndex = (this.page * this.dogPerPage) - this.dogPerPage;
      const stopIndex = (this.page * this.dogPerPage) - 1;
      if (index >= startIndex && index <= stopIndex) { return true; }
      return false;
    },
    DecreasePage() {
      let newPage = this.page - 1;
      if (newPage < 1) { newPage = this.GetPageCount(); }
      else { newPage = this.page - 1; }

      this.page = newPage;
      console.log(this.page);
    },
    IncreasePage() {
      let newPage = this.page + 1;

      if (newPage > this.GetPageCount()) { newPage = 1 }
      else { newPage = this.page + 1; }

      this.page = newPage;
    },
    GetPageCount() {
      return Math.ceil(this.dogs.length / this.dogPerPage);
    },
    async HighlightDog(dogIndex) {
      if (this.selectedDog == null) {
        this.showDogSkills = true;
        this.selectedDog = dogIndex;
        await resolveAfter(750);
      } else {
        await this.HideDogsSkills();
        this.selectedDog = dogIndex;
      }

      await this.ShowDogsSkills();
    },
    async ShowDogsSkills() {
      this.showSkillsCover = false;
    },
    async HideDogsSkills() {
      this.showSkillsCover = true;

      await resolveAfter(500);
    },
    async CloseButton() {
      await this.HideDogsSkills();

      if (this.showDogSkills) {
        this.showDogSkills = false;
        await resolveAfter(750);
      }

      this.$emit("close");
    },
    ToggleCreator() {
      this.showCreator = !this.showCreator;
    },
    CreateK9(data) {
      this.showCreator = false;
      axios.post(`https://${GetParentResourceName()}/createK9`, data).then(() => {
        this.UpdateK9List();
      })
    },
    SelectK9() {},
    DeleteK9() {},
    UpdateK9List(dogList) {
      this.dogs = dogList;
    }
  },
  mounted() {
    RegisterEvent("updateK9List", this.EVENT_UpdateK9List);
  },
  components: { KennelCard, KennelSkill, KennelCreator },
  template: `
    <div class="kennel_container">
      <div class="kennel_header">
        KENNEL
        <div class="kennel_container_close" v-show="!showCreator" @click="CloseButton">
          <image />
        </div>
        <div class="kennel_container_new" v-show="!showCreator" @click="ToggleCreator">
          <image />
        </div>
      </div>
      <div class="kennel_body">

        <kennel-card
          v-for="(dog, dogIndex) in dogs"
          v-show="DisplayCard(dogIndex)"
          :dog="dog"
          :class="{ 'kennel_dog_selected': selectedDog == dogIndex }"
          @click="HighlightDog(dogIndex)"
        />

        <div class="kennel_pagination" v-show="!showCreator">
          <div class="kennel_pagination_button" @click="DecreasePage">[</div>
          <div class="kennel_pagination_page">{{ page }} / {{ GetPageCount() || 1 }}</div>
          <div class="kennel_pagination_button" @click="IncreasePage">]</div>
        </div>

        <div
          :class="{ 'kennel_skills': true, 'kennel_skills_animate_out': !showDogSkills, 'kennel_skills_animate_in': showDogSkills }"
          v-if="selectedDog != null && dogs[selectedDog].skills">

          <kennel-skill
            v-for="(skill, skillIndex) in dogs[selectedDog].skills"
            :name="skill.skill"
            :level="skill.level"
            :trained="skill.trained"
          />
          <div :class="{ 'kennel_skills_cover': true, 'kennel_skills_cover_animate_cover': showSkillsCover, 'kennel_skills_cover_animate_uncover': !showSkillsCover }"></div>
        </div>

        <div class="kennel_cover" v-show="showCreator"></div>

        <kennel-creator
          v-show="showCreator"
          @close="ToggleCreator"
          @create="CreateK9">
        </kennel-creator>
      </div>
    </div>
  `
}