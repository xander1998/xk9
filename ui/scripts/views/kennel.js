const Kennel = {
  props: {
    dogs: { type: Array, required: false, default: [] }
  },
  data() {
    return {
      showCreator: false,
      page: 1,
      dogPerPage: 4,
      showDogSkills: false,
      showSkillsCover: false,
      selectedDog: null
    }
  },
  methods: {
    DisplayCard(index) {
      const startIndex = (this.page * this.dogPerPage) - this.dogPerPage;
      const stopIndex = (this.page * this.dogPerPage) - 1;
      if (index >= startIndex && index <= stopIndex) { return true; }
      return false;
    },
    DecreasePage() {
      if (this.page - 1 < 1) { this.page = this.dogs.length / this.dogPerPage; }
      else { this.page = this.page - 1; }
    },
    IncreasePage() {
      if (this.page + 1 > this.dogs.length / this.dogPerPage) { this.page = 1 }
      else { this.page = this.page + 1; }
    },
    async SelectDog(dogIndex) {
      this.selectedDog = dogIndex;

      if (this.selectedDog != null) {
        await this.HideDogsSkills();
        this.selectedDog = dogIndex;
      } else {
        this.selectedDog = dogIndex;
        this.showDogSkills = true;
        await awaitResolveAfter(750);
      }

      await this.ShowDogsSkills();
    },
    async ShowDogsSkills() {
      this.showSkillsCover = true;
    },
    async HideDogsSkills() {
      this.showSkillsCover = false;

      await awaitResolveAfter(500);
    },
    async CloseButton() {
      this.showSkillsCover = false;
      await awaitResolveAfter(500);

      this.showDogSkills = true;
      await awaitResolveAfter(750);

      this.$emit("close");
    }
  },
  components: { KennelCard, KennelSkill },
  template: `
    <div class="kennel_container">
      <div class="kennel_header">
        KENNEL
        <div class="kennel_container_close" @click="CloseButton">
          <image />
        </div>
        <div class="kennel_container_new">
          <image />
        </div>
      </div>
      <div class="kennel_body">

        <kennel-card
          v-for="(dog, dogIndex) in dogs"
          v-show="DisplayCard(dogIndex)"
          :dog="dog"
          :class="{ 'kennel_dog_selected': selectedDog == dogIndex }"
          @click="SelectDog(dogIndex)"
        />

        <div class="kennel_pagination">
          <div class="kennel_pagination_button" @click="DecreasePage">[</div>
          <div class="kennel_pagination_page">{{ page }}</div>
          <div class="kennel_pagination_button" @click="IncreasePage">]</div>
        </div>

        <div
          :class="{ 'kennel_skills': true, 'kennel_skills_animate_out': showDogSkills, 'kennel_skills_animate_in': !showDogSkills }"
          v-if="selectedDog != null && dogs[selectedDog].skills">

          <kennel-skill
            v-for="(skill, skillIndex) in dogs[selectedDog].skills"
            :name="skill.skill"
            :level="skill.level"
            :trained="skill.trained"
          />
          <div :class="{ 'kennel_skills_cover': true, 'kennel_skills_cover_animate_cover': !showSkillsCover, 'kennel_skills_cover_animate_uncover': showSkillsCover }"></div>
        </div>
      </div>

      <!-- Creator UI Here -->
    </div>
  `
}