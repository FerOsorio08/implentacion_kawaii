import { Admin, Resource, ShowGuesser , defaultTheme, useTheme, Layout} from "react-admin";
import { dataProvider } from "./dataProvider";
import { PostList, PostEdit, PostCreate } from "./posts";
import { UserList } from "./users";
import { Dashboard } from "./Dashboard";
import { authProvider } from "./authProvider";
import { i18nProvider } from "./i18nProvider";
import { Button } from '@mui/material';
import { MyAppBar } from './MyAppBar';


import PostIcon from "@mui/icons-material/Book";
import UserIcon from "@mui/icons-material/Group";


export const App = () => (
  <Admin i18nProvider={i18nProvider} authProvider={authProvider} dataProvider={dataProvider} dashboard={Dashboard} 
        darkTheme={{ palette: { mode: 'dark' } }}>
      <Resource name="posts" list={PostList} edit={PostEdit} create={PostCreate} icon={PostIcon} />
      <Resource name="users" list={UserList} show={ShowGuesser} recordRepresentation="name" icon={UserIcon} />
  </Admin>
);



export const ThemeToggler = () => {
  const [theme, setTheme] = useTheme();

  return (
      <Button onClick={() => setTheme(theme === 'dark' ? 'light' : 'dark')}>
          {theme === 'dark' ? 'Switch to light theme' : 'Switch to dark theme'}
      </Button>
  );
}

