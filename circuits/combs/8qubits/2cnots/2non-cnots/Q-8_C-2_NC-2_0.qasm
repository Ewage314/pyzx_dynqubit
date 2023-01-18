OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[7], q[6];
x q[3];
x q[0];
cx q[4], q[2];
