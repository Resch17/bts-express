import { PrismaClient } from '@prisma/client';
import express from 'express';

const router = express.Router();

const prisma = new PrismaClient();

router.get('/', async (req, res) => {
    const projectStatuses = await prisma.projectstatus.findMany({});
    res.json(projectStatuses);
});

router.get('/:id', async (req, res) => {
    const { id } = req.params;
    const projectStatus = await prisma.projectstatus.findUnique({
        where: { id: Number(id) },
    });
    if (projectStatus !== null) {
        res.json(projectStatus);
    } else {
        res.status(400).json({ message: 'No project status found' });
    }
});

export default router;
