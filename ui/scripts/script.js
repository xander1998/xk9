Vue.createApp({
  data() {
    return {
      showView: true,
      currentView: "kennel",
      dogs: [
        { name: "Testing1", gender: "Male", color: "Brown", recruited: "0/0/0000", skills: [
          { skill: "Illegal Substances", level: 0, trained: null },
          { skill: "Attack", level: 0, trained: "0/0/0000" }
        ] },
        { name: "Testing2", gender: "Male", color: "Black/White", recruited: "0/0/0000", skills: [
          { skill: "Illegal Substances", level: 0, trained: null },
          { skill: "Attack", level: 0, trained: null }
        ] },
        { name: "Testing3", gender: "Female", color: "Brown", recruited: "0/0/0000", skills: [
          { skill: "Illegal Substances", level: 0, trained: null },
          { skill: "Attack", level: 0, trained: null }
        ] },
        { name: "Testing4", gender: "Female", color: "Brown", recruited: "0/0/0000", skills: [
          { skill: "Illegal Substances", level: 0, trained: null },
          { skill: "Attack", level: 0, trained: null }
        ] },
        { name: "Testing5", gender: "Male", color: "Brown", recruited: "0/0/0000", skills: [
          { skill: "Illegal Substances", level: 0, trained: null },
          { skill: "Attack", level: 0, trained: null }
        ] },
        { name: "Testing6", gender: "Male", color: "Black/White", recruited: "0/0/0000", skills: [
          { skill: "Illegal Substances", level: 0, trained: null },
          { skill: "Attack", level: 0, trained: null }
        ] },
        { name: "Testing7", gender: "Female", color: "Brown", recruited: "0/0/0000", skills: [
          { skill: "Illegal Substances", level: 0, trained: null },
          { skill: "Attack", level: 0, trained: null }
        ] },
        { name: "Testing8", gender: "Female", color: "Brown", recruited: "0/0/0000", skills: [
          { skill: "Illegal Substances", level: 0, trained: null },
          { skill: "Attack", level: 0, trained: null }
        ] }
      ]
    }
  },
  methods: {
    EVENT_ShowView(data) {
      this.showView = data.show;
    },
    EVENT_ChangeView(data) {
      this.currentView = data.view
    },
    CloseView() {
      this.showView = false;
      // axios.post("http://xk9/close_view");
    }
  },
  components: { Kennel },
  mounted() {
    RegisterEvent("show-view", this.EVENT_ShowView);
    RegisterEvent("change-view", this.EVENT_ChangeView);
  },
}).mount("#app");