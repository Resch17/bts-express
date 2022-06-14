import { PrismaClient } from '@prisma/client';
import express from 'express';

const router = express.Router();

const prisma = new PrismaClient();

router.post('/', async (req, res) => {
    const { projectid, fabricid, yards } = req.body;
    try {
        const result = await prisma.projectfabric.create({
            data: {
                projectid,
                fabricid,
                yards,
            },
        });
        res.status(201).json(result);
    } catch (err) {
        console.error(err);
        res.status(400).json({ message: 'Something went wrong' });
    }
});

router.delete('/:id', async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.projectfabric.delete({
            where: { id: Number(id) },
        });
        res.status(204).json();
    } catch (err) {
        res.status(400).json();
    }
});

export default router;
