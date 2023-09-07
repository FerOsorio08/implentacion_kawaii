import polyglotI18nProvider from 'ra-i18n-polyglot';
import {spanishMessages} from './spanishMessages';
// import {englishMessages} from './englishMessages';

export const i18nProvider = polyglotI18nProvider(
    locale => spanishMessages, 'es'
);