import { createRouter, createWebHistory } from 'vue-router';
import HomePage from '@/components/HomePage.vue';
import About from '@/components/AboutUs.vue';
import LoginToo from '@/components/LoginToo.vue';
import SignUp from '@/components/SignUp.vue';
import ForgetPassword from '@/components/ForgetPassword.vue';
import Insights from '@/components/InsightView.vue';
import EditCertain from '@/components/EditCertain.vue';
import TaskList from '@/components/TaskList.vue';
import PomodoroTimer from '@/components/PomodoroTimer.vue';
import CalendarM from '@/components/CalendarM.vue';
import CreateTask from '@/components/CreateTask.vue';
import TaskEditor from '@/components/TaskEditor.vue';
import HighPriorityTasks from '@/components/HighPriorityTasks.vue';
import MediumPriorityTasks from '@/components/MediumPriorityTasks.vue';
import BasicPriorityTasks from '@/components/BasicPriorityTasks.vue';
import NotificationP from '@/components/NotificationP.vue';
import SettingsPage from '@/components/SettingsPage.vue';
import PrivacyPage from '@/components/PrivacyPage.vue';
import NotePage from '@/components/NotePage.vue';
import DisplayP from '@/components/DisplayP.vue';
import TermsOfService from '@/components/TermsOfService.vue';
import FaqsP from '@/components/FaqsP.vue';
import InProgress from '@/components/InProgress.vue';
import DueToday from '@/components/DueToday.vue';
import SpecialQuest from '@/components/SpecialQuest.vue';
import UserDashboard from '@/components/UserDashboard.vue';
const routes = [
  { path: '/', name: 'HomePage', component: HomePage },
  { path: '/about', name: 'AboutUs', component: About },
  { path: '/login', name: 'LoginToo', component: LoginToo },
  { path: '/signup', name: 'SignUp', component: SignUp },
  { path: '/forgot-password', name: 'ForgetPassword', component: ForgetPassword },
  { path: '/notifications', name: 'NotificationP', component: NotificationP },
  { path: '/insights', name: 'InsightView', component: Insights },
  { path: '/pomodoro-timer', name: 'PomodoroTimer', component: PomodoroTimer },
  { path: '/calendar', name: 'CalendarM', component: CalendarM },

  { path: '/tasks', name: 'TaskList', component: TaskList },
  { path: '/tasks/edit/:id', name: 'EditCertain', component: EditCertain},
  { path: '/create-task', name: 'CreateTask', component: CreateTask },
  { path: '/edit-quest', name: 'TaskEditor', component: TaskEditor },
  { path: '/high-priority', name: 'HighPriorityTasks', component: HighPriorityTasks },
  { path: '/medium-priority', name: 'MediumPriorityTasks', component: MediumPriorityTasks },
  { path: '/basic-priority', name: 'BasicPriorityTasks', component: BasicPriorityTasks },
  { path: '/settings', name: 'SettingsPage', component: SettingsPage },
  { path: '/privacy', name: 'PrivacyPage', component: PrivacyPage },
  { path: '/notes', name: 'NotePage', component: NotePage },
  { path: '/display', name: 'DisplayP', component: DisplayP },
  { path: '/terms-of-service', name: 'TermsOfService', component: TermsOfService },
  { path: '/faqs', name: 'FaqsP', component: FaqsP },
  { path: '/in-progress', name: 'InProgress', component: InProgress },
  { path: '/due-today', name: 'DueToday', component: DueToday },
  { path: '/special-quest', name: 'SpecialQuest', component: SpecialQuest },
  { path: '/dashboard', name: 'UserDashboard', component: UserDashboard }, // Route pour le tableau de bord
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
