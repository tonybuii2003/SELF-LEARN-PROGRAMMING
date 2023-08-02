const { Model } = require('mongoose');

require('dotenv').config();
mongoose = require('mongoose');
const Schema = mongoose.Schema;
mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => {
    console.log('Database connection successful');
  })
  .catch((err) => {
    console.error('Database connection error');
  });
let personSchema = new Schema({
  name: { type: String, required: true },
  age: Number,
  favoriteFoods: [String]
});
const Person = mongoose.model("Person", personSchema);
const createAndSavePerson = (done) => {
  let person = new Person({
    name: 'Tony',
    age: 20,
    favoriteFoods: ['cheesecake', 'steak', 'rice paper']
  });
  person.save()
    .then((doc) => {
      console.log("Created: \n" + doc);
      done(null, doc);
    }).catch((err) => {
      console.log(err);
    });
};

const createManyPeople = (arrayOfPeople, done) => {
  Person.create(arrayOfPeople)
    .then(doc => {
      console.log("Created: \n" + doc);
      done(null, doc);
    }).catch((err) => {
      console.log(err);
    });;
};

const findPeopleByName = (personName, done) => {
  console.log("Finding person with name " + personName + " ...\n");
  Person.find({
    name: personName
  }).then((doc) => {
    console.log(doc);
    done(null, doc);
  }).catch((err) => {
    console.log(err);
  });
};

const findOneByFood = (food, done) => {
  console.log("Finding person with favorite foods: " + food + " ...\n");
  Person.findOne({
    favoriteFoods: food
  }).then((doc) => {
    console.log(doc);
    done(null, doc);
  }).catch((err) => {
    console.log(err);
  });
};

const findPersonById = (personId, done) => {
  console.log("Finding person using id: " + personId + " ...\n");
  Person.findById({
    _id: personId
  }).then((doc) => {
    console.log(doc);
    done(null, doc);
  }).catch((err) => {
    console.log(err);
  });
};

const findEditThenSave = (personId, done) => {
  const foodToAdd = "hamburger";
  console.log("Finding person using id: " + personId + " ...\n");
  Person.findById({
    _id: personId
  }).then((person) => {
    console.log("The data of the person found: \n");
    console.log(person);
    person.favoriteFoods.push(foodToAdd);
    person.save().then((doc) => {
      console.log("Added " + foodToAdd + ", current data:\n");
      console.log(doc);
      done(null, doc);
    }).catch((err) => {
      console.log(err);
    });
  }).catch((err) => {
    console.log(err);
  });
};

const findAndUpdate = (personName, done) => {
  const ageToSet = 20;
  console.log("Find person with name: %s and replace person's age with %d...\n", personName, ageToSet);
  Person.findOneAndUpdate(
    {
      name: personName
    },
    {
      age: 20
    },
    {
      new: true
    }
  ).then((doc) => {
    console.log(doc);
    done(null, doc);
  }).catch((err) => {
    console.log(err);

  });
};

const removeById = (personId, done) => {
  console.log("Finding person and remove using their id: %s...\n", personId);
  Person.findOneAndRemove(
    {
      _id: personId
    }
  ).then((doc) => {
    console.log(doc);
    done(null, doc);
  }).catch((err) => {
    console.log(err);
  })
};

const removeManyPeople = (done) => {
  const nameToRemove = "Mary";
  Person.remove({
    name: nameToRemove
  }).then((doc) => {
    console.log(doc);
    done(null, doc);
  }).catch((error) => {
    console.log(error);
  });

};

const queryChain = (done) => {
  const foodToSearch = "burrito";
  Person.find({
    favoriteFoods: foodToSearch
  })
    .sort({ name: 1 })
    .limit(2)
    .select({ age: 0 })
    .exec((err, data) => {
      if (err) {
        console.log(err);
        done(err);
      }
      console.log(data);
      done(null, data);

    });
};

/** **Well Done !!**
/* You completed these challenges, let's go celebrate !
 */

//----- **DO NOT EDIT BELOW THIS LINE** ----------------------------------

exports.PersonModel = Person;
exports.createAndSavePerson = createAndSavePerson;
exports.findPeopleByName = findPeopleByName;
exports.findOneByFood = findOneByFood;
exports.findPersonById = findPersonById;
exports.findEditThenSave = findEditThenSave;
exports.findAndUpdate = findAndUpdate;
exports.createManyPeople = createManyPeople;
exports.removeById = removeById;
exports.removeManyPeople = removeManyPeople;
exports.queryChain = queryChain;
