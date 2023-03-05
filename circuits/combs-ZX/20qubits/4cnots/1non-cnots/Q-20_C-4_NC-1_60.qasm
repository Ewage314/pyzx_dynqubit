OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[19], q[13];
cx q[0], q[6];
cx q[11], q[2];
x q[1];
cx q[14], q[7];
