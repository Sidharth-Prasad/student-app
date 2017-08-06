import { Injectable }    from '@angular/core';
import { Headers, Http } from '@angular/http';
import { Subject } from 'rxjs/Subject'
import { BehaviorSubject } from 'rxjs/BehaviorSubject';
import { Observable }     from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';

@Injectable()
export class StudentService {

  configData : BehaviorSubject<any>;
  worldData : BehaviorSubject<any>;

  get readConfigDataObservable() {
    return this.configData.asObservable();
  }

  get readWorldDataObservable() {
    return this.worldData.asObservable();
  }

  constructor(private http: Http) {
    this.configData = new BehaviorSubject({});
    this.worldData = new BehaviorSubject({});

  }
 
  getConfigData(): any{
    var me = this;
    this.http
               .get(`../../assets/JSON/student.json`)
               .map(response => response.json())
               .subscribe(res => {me.configData.next(res)});
  }
  getWorldData(): any{
    var me = this;
    this.http
               .get(`../../assets/JSON/world.json`)
               .map(response => response.json())
               .subscribe(res => {me.worldData.next(res)});
  }

  postFormData(): any{
    var me = this;
    this.http
               .get(`../../assets/JSON/world.json`)
               .map(response => response.json())
               .subscribe(res => {me.worldData.next(res)})


  }
}