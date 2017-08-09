import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';
import { HttpClient } from '@angular/common/http';
import { HttpParams } from '@angular/common/http';
import { Subject } from 'rxjs/Subject'
import { BehaviorSubject } from 'rxjs/BehaviorSubject';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';

@Injectable()
export class StudentService {

  configData: BehaviorSubject<any>;
  worldData: BehaviorSubject<any>;
  resultData: BehaviorSubject<any>;

  get readConfigDataObservable() {
    return this.configData.asObservable();
  }

  get readWorldDataObservable() {
    return this.worldData.asObservable();
  }
  get readResultDataObservable() {
    return this.resultData.asObservable();
  }
  constructor(private http: Http) {
    this.configData = new BehaviorSubject({});
    this.worldData = new BehaviorSubject({});
    this.resultData = new BehaviorSubject({});

  }

  getConfigData(): any {
    var me = this;
    this.http
      .get(`../../assets/JSON/student.json`)
      .map(response => response.json())
      .subscribe(res => { me.configData.next(res) });
  }
  getWorldData(): any {
    var me = this;
    this.http
      .get(`../../assets/JSON/world.json`)
      .map(response => response.json())
      .subscribe(res => { me.worldData.next(res) });
  }

  postFormData(student): any {
    var me = this;
    var results:object;
    this.http
      .post('http://localhost:8000/recommend?student='+ JSON.stringify(student),"")
      .map(response => response.json())
      .subscribe(res => { me.getItemInfo(res)  });  
    

  }

  getItemInfo(rec: any){

    var temp = [];
    for(var i in rec){
      var data = rec[i];

      this.http
      .post('http://localhost:8000/itemInfo?item='+ JSON.stringify(data),"")
      .map(response => response.json())
      .subscribe(res => { temp.push(res)  });  

    }
     this.resultData.next(temp);
  }
}