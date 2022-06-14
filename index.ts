import express from 'express';
import cors from 'cors';
import bodyParser from 'body-parser';
import categoryRoutes from './controllers/categoryController';
import fabricRoutes from './controllers/fabricController';
import fabricImageRoutes from './controllers/fabricImageController';
import fabricTypeRoutes from './controllers/fabricTypeController';
import patternFileRoutes from './controllers/patternFileController';
import patternRoutes from './controllers/patternController';
import patternImageRoutes from './controllers/patternImageController';
import patternSizeRoutes from './controllers/patternSizeController';
import projectRoutes from './controllers/projectController';
import projectFabricRoutes from './controllers/projectFabricController';
import projectNoteRoutes from './controllers/projectNoteController';
import projectStatusRoutes from './controllers/projectStatusController';
import publisherRoutes from './controllers/publisherController';
import retailerRoutes from './controllers/retailerController';
import sizeRoutes from './controllers/sizeController';
import userRoutes from './controllers/userController';
import testRoutes from './controllers/testController';

const PORT = process.env.PORT || 8088;

const app = express();

app.use(express.json());
app.use(bodyParser.raw({ type: '*/*', limit: '50mb' }));
app.use(cors());

app.use('/category', categoryRoutes);
app.use('/fabric', fabricRoutes);
app.use('/fabricimage', fabricImageRoutes);
app.use('/fabrictype', fabricTypeRoutes);
app.use('/patternfile', patternFileRoutes);
app.use('/pattern', patternRoutes);
app.use('/patternimage', patternImageRoutes);
app.use('/patternsize', patternSizeRoutes);
app.use('/projectfabric', projectFabricRoutes);
app.use('/project', projectRoutes);
app.use('/projectnote', projectNoteRoutes);
app.use('/projectstatus', projectStatusRoutes);
app.use('/publisher', publisherRoutes);
app.use('/retailer', retailerRoutes);
app.use('/size', sizeRoutes);
app.use('/user', userRoutes);
app.use('/test', testRoutes);

app.listen(PORT, () =>
    console.log(`Server running on http://192.168.1.132:${PORT}`)
);
