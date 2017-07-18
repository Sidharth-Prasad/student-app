import { StudentAppPage } from './app.po';

describe('student-app App', () => {
  let page: StudentAppPage;

  beforeEach(() => {
    page = new StudentAppPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!');
  });
});
