import "package:firebase_auth/firebase_auth.dart" as fireUser;
import "package:blog_posts/models/user.dart";

//Login user anonimno
   class  LoginService{
     final fireUser.FirebaseAuth _log=fireUser.FirebaseAuth.instance;
     User? _firebaseUser(user){
        return user != null? User(uid: user.uid) : null;
     }

     Stream<User?> get streamUser {
       return _log.authStateChanges()
           .map((user) => _firebaseUser(user));

     }

     //Login anonimno
     Future logInAnon() async{
       try{
         fireUser.UserCredential result= await _log.signInAnonymously();
         var user= result.user;
         print(user);
         print(result.user?.uid);
         return _firebaseUser(user);
       }
       catch(e){
         print(e.toString() + "jos nekej");
         return null;
       }
     }

     //Sign out
   Future signOut() async {
     try{
      return await _log.signOut();
     }
     catch(e){
       print(e.toString());
       return null;
     }
   }

   //Registracija
   Future register(String email, String password) async{
     try{
      var result= await _log.createUserWithEmailAndPassword(email: email, password: password);
     var user=result.user;
     return _firebaseUser(user);
     }
     catch(e){
       print(e.toString());
       return null;
     }
   }
//Sign in
     Future signIn(String email, String password) async{
       try{
         var result= await _log.signInWithEmailAndPassword(email: email, password: password);
         var user=result.user;
         return _firebaseUser(user);
       }
       catch(e){
         print(e.toString());
         return null;
       }
     }

   }