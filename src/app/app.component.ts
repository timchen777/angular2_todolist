import {Component} from '@angular/core';
import {Todo} from './todo';
// Import class so we can use it as dependency injection token in the constructor
import {TodoDataService} from './todo-data.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  providers: [TodoDataService]
})
export class AppComponent {
  // title = 'app works!';
  // We first define a newTodo property and assign a new Todo() when the component class is instantiated.
  // This is the same Todo instance specified in the two-way binding expression of [(ngModel)] in our view 
  // inside  file applicationCache.component.html 
  newTodo: Todo = new Todo();
  // Now that the component’s dependency injector knows what it needs to provide, we ask it to 
  // inject the TodoDataService instance in our component by specifying the dependency 
  // in the AppComponent constructor:
  constructor(private todoDataService: TodoDataService) {  
  }

  // Service is now available as this.todoDataService
  addTodo() {
    this.todoDataService.addTodo(this.newTodo);
    this.newTodo = new Todo();
  }

  toggleTodoComplete(todo) {
    this.todoDataService.toggleTodoComplete(todo);
  }

  removeTodo(todo) {
    this.todoDataService.deleteTodoById(todo.id);
  }

  get todos() {
    return this.todoDataService.getAllTodos();
  }

}
