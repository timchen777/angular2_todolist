REF:https://www.sitepoint.com/angular-2-tutorial/
https://github.com/sitepoint-editors/todo-app
Angular 2 Tutorial: Create a CRUD App with Angular CLI

    initialize your Todo application using Angular CLI
    create a Todo class to represent individual todo’s
    create a TodoDataService service to create, update and remove todo’s
    use the AppComponent component to display the user interface
    deploy your application to GitHub pages

1.$ npm install -g angular-cli
2.$ ng version
angular-cli: 1.0.0-beta.28.3
node: 6.9.1
os: win32 x64
3.$  ng new todo-app
4.$ cd todo-app
5.$ ng serve
which will start a local development server that you can navigate to in your browser on http://localhost:4200/.
--> see "App Works!"
===================================
Because Angular CLI generates TypeScript files, we can use a class to represent Todo items.
So let’s use Angular CLI to generate a Todo class for us:
6.$ cd todo-app
7.$ ng generate class Todo --spec
which will create:
src/app/todo.spec.ts
src/app/todo.ts
7. Let’s open up src/app/todo.ts:
export class Todo {
}
8. and add the logic we need:
export class Todo {
  id: number;
  title: string = '';
  complete: boolean = false;
  constructor(values: Object = {}) {
    Object.assign(this, values);
  }
}
9. We also provide constructor logic that lets us specify property values during instantiation so we can easily create new Todo instances like this:
let todo = new Todo({
  title: 'Read SitePoint article',
  complete: false
});
10. While we are at it, let’s add a unit test to make sure our constructor logic works as expected.
When generating the Todo class, we used the --spec option. This told Angular CLI to also generate src/app/todo.spec.ts for us with a basic unit test:
import {Todo} from './todo';
describe('Todo', () => {
  it('should create an instance', () => {
    expect(new Todo()).toBeTruthy();
  });
});
11.Let’s add an additional unit test to make sure the constructor logic works as expected:
import {Todo} from './todo';
describe('Todo', () => {
  it('should create an instance', () => {
    expect(new Todo()).toBeTruthy();
  });
  it('should accept values in the constructor', () => {
    let todo = new Todo({
      title: 'hello',
      complete: true
    });
    expect(todo.title).toEqual('hello');
    expect(todo.complete).toEqual(true);
  });
});
12.To verify whether our code works as expected, we can now run:
$ ng test
--> browser see http://localhost:9876/?id=44138992
    Karma v1.2.0 - connected     DEBUG
    Chrome 56.0.2924 (Windows 10 0.0.0) is idle
>> cmd box shows Chrome 56.0.2924 (Windows 10.0.0.0): Excuted 5 of 5 SUCCESS
=================== Create TodoDataService ======
13.
$ ng generate service TodoData
which outputs:
installing service
  create src/app/todo-data.service.spec.ts
  create src/app/todo-data.service.ts
Karma comes pre-configured with Jasmine. You can read the Jasmine documentation to 
learn more about the Jasmine syntax.
14.$ ng test
15.$ ng serve
in your browser on http://localhost:4200/.
--> see "App Works!" again
=======================



    


